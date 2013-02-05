#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"

@class DOUBook;


@interface BooksViewController : UITableViewController<BookImageRequestDelegate>
- (void)retrieveBooks:(NSString *)status;

- (void)bookStatusChanged:(DOUBook *)book;


@end