#import "BookDetailViewController.h"
#import "BookDetailView.h"
#import "DOUBook.h"
#import "BookStatusChangeRequest.h"
#import "BookStatusViewController.h"
#import "WishBookDetailView.h"
#import "BookMediumImageRequest.h"
#import "SearchBookDetailView.h"
#import "BookInfoRequest.h"
#import "CommentViewController.h"

@implementation BookDetailViewController {
    BookDetailView *detailView;
    DOUBook *book;
    BookListViewController *booksViewController;
    BookMediumImageRequest *imageRequest;
    BookInfoRequest *bookInfoRequest;
    CommentViewController *commentViewController;
}

- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookListViewController *)theBooksViewController {
    self = [super init];
    if (self) {
        book = theBook;
        booksViewController = theBooksViewController;
        imageRequest = [[BookMediumImageRequest alloc] initWithBook:theBook andDelegate:self];
        bookInfoRequest = [[BookInfoRequest alloc] initWithBook:theBook andDelegate:self];
    }
    return self;
}

- (void)loadView {
    switch ([book status]) {
        case READING:
            detailView = [[BookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case WISH:
            detailView = [[WishBookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case READ:
            detailView = [[BookDetailView alloc] initWithBook:book andTarget:self];
            break;
        case NOTADDED:
            detailView = [[SearchBookDetailView alloc] initWithBook:book andTarget:self];
            break;
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:detailView action:@selector(showActionSheet)];
    self.navigationItem.rightBarButtonItem = barButtonItem;

    self.view = detailView;
    if (book.mediumImage == nil) {
        [imageRequest startDownload];
    }
    [bookInfoRequest getInfo];
}

- (void)finishReading {
    [self popCommentViewWithAction:@selector(finishReading)];
}

- (void)reading {
    [self popCommentViewWithAction:@selector(reading)];
}

- (void)popCommentViewWithAction:(SEL)action{
    commentViewController = [[CommentViewController alloc] initWithNibName:@"CommentViewController" bundle:nil];
    [commentViewController setAction:action];
    [commentViewController setBook:book];
    [commentViewController setTarget:self];
    [self.navigationController pushViewController:commentViewController animated:YES];
}

- (void)addToReading {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request addBook:book withStatus:@"reading"];
}

- (void)addToWish {
    BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
    [request addBook:book withStatus:@"wish"];
}

- (void)deleteBook {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"删除图书" message:@"确认要删除这本书么？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            break;
        case 1: {
            BookStatusChangeRequest *request = [[BookStatusChangeRequest alloc] initWithDelegate:self];
            [request deleteBook:[book id]];
            break;
        }
        default:
            break;
    }
}


- (void)bookChangeRequestDidFinish {
    [booksViewController bookStatusChanged:book];
    [detailView showCommentAndUpdateStatus];
}

- (void)bookInfoRequestDidFinish {
    [detailView showSummary];
}

- (void)bookImageDidLoad:(UIImage *)image {
    [detailView showImage:image];
}

@end