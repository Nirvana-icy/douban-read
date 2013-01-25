#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"


@interface BooksViewController : UITableViewController<BookImageRequestDelegate>
- (void)retrieveBooks:(NSString *)status;

@end