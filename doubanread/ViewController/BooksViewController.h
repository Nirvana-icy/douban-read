#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"

@class DOUBook;


@interface BooksViewController : UITableViewController<BookImageRequestDelegate>

- (void)retrieveBooks:(NSString *)status;

- (void)bookStatusChanged:(DOUBook *)book;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (BOOL)isLoading;

- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)moreBookRequestDidFinish:(NSArray *)theBooks;


@end