#import <Foundation/Foundation.h>

@class DOUBook;
@class BooksViewController;

@interface BookDetailViewController : UIViewController
- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BooksViewController *)theBooksViewController;

- (void)finishReading;

- (void)wishRead;

- (void)reading;

@end