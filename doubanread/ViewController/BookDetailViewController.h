#import <Foundation/Foundation.h>

@class DOUBook;
@class BookStatusViewController;

@interface BookDetailViewController : UIViewController
- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookStatusViewController *)theBooksViewController;

- (void)finishReading;

- (void)wishRead;

- (void)reading;

@end