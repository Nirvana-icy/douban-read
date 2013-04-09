#import "BookDetailViewController.h"
#import "BookDetailView.h"
#import "DOUBook.h"
#import "BookStatusChangeRequest.h"
#import "ReadingBookDetailView.h"
#import "BookStatusViewController.h"
#import "WishBookDetailView.h"
#import "ReadBookDetailView.h"
#import "BookMediumImageRequest.h"

@implementation BookDetailViewController {
    BookDetailView *detailView;
    DOUBook *book;
    BookListViewController *booksViewController;
    BookMediumImageRequest *imageRequest;
}

- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookListViewController *)theBooksViewController {
    self = [super init];
    if (self) {
        book = theBook;
        booksViewController = theBooksViewController;
        imageRequest = [[BookMediumImageRequest alloc] initWithBook:theBook andDelegate:self];
    }
    return self;
}

- (void)loadView {
    switch ([book status]) {
        case READING:
            detailView = [[ReadingBookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case WISH:
            detailView = [[WishBookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case READ:
            detailView = [[ReadBookDetailView alloc] initWithBook:book andTarget:self];
            break;
    }
    self.view = detailView;
    if(book.mediumImage == nil){
        [imageRequest startDownload];
    }
}

- (void)finishReading {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"read"];
}

- (void)wishRead {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"wish"];
}

- (void)reading {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request changeBook:[book id] toStatus:@"reading"];
}

- (void)delete{
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request deleteBook:[book id]];
}

- (void)bookChangeRequestDidFinish {
    NSLog(@"book change request finished");
    [[self navigationController] popViewControllerAnimated:YES];
    [booksViewController bookStatusChanged:book];
}

- (void)bookImageDidLoad:(UIImage *)image {
    [detailView showImage:image];
}

@end