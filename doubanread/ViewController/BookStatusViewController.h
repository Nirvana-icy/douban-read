#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"

@class DOUBook;


@interface BookStatusViewController : UITableViewController<BookImageRequestDelegate>{
    NSString *bookStatus;
}

- (void)retrieveBooks;

- (void)bookStatusChanged:(DOUBook *)book;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (void)bookRequestDidFinish:(NSArray *)theBooks;

- (BOOL)isLoading;

- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)moreBookRequestDidFinish:(NSArray *)theBooks;


- (void)connectionFailed;
@end