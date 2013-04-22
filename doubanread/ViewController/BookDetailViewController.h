#import <Foundation/Foundation.h>
#import "BookMediumImageRequestDelegate.h"

@class DOUBook;
@class BookStatusViewController;
@class BookListViewController;

@interface BookDetailViewController : UIViewController <BookMediumImageRequestDelegate, UIAlertViewDelegate>
- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookListViewController *)theBooksViewController;

- (void)finishReading;

- (void)reading;

- (void)addToReading;

- (void)addToWish;

- (void)deleteBook;
@end