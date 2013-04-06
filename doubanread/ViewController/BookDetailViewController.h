#import <Foundation/Foundation.h>

@class DOUBook;
@class BookStatusViewController;
@class BookListViewController;

@interface BookDetailViewController : UIViewController
- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookListViewController *)theBooksViewController;

- (void)finishReading;

- (void)wishRead;

- (void)reading;

@end