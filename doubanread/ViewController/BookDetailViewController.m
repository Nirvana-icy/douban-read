#import "BookDetailViewController.h"
#import "BookDetailView.h"
#import "DOUBook.h"


@implementation BookDetailViewController {
    BookDetailView *detailView;
    DOUBook *book;
}

- (void)loadView {
    detailView = [[BookDetailView alloc] initWithBook: book];
    self.view = detailView;
}

- (id)initWithBook:(DOUBook *)theBook {
    self = [super init];
    if (self) {
        book = theBook;
    }
    return self;
}

@end