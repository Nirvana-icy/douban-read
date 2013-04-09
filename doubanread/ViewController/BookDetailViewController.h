#import <Foundation/Foundation.h>
#import "BookMediumImageRequestDelegate.h"

@class DOUBook;
@class BookStatusViewController;
@class BookListViewController;

@interface BookDetailViewController : UIViewController <BookMediumImageRequestDelegate>
- (id)initWithBook:(DOUBook *)theBook andBooksViewController:(BookListViewController *)theBooksViewController;

- (void)finishReading;

- (void)wishRead;

- (void)reading;

@end