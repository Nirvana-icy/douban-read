#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"
#import "BookListViewController.h"

@class DOUBook;


@interface BookStatusViewController : BookListViewController{
    NSString *bookStatus;
}

- (void)retrieveBooks;

- (void)bookStatusChanged:(DOUBook *)book;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (void)bookRequestDidFinish:(NSArray *)theBooks;

- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)moreBookRequestDidFinish:(NSArray *)theBooks;

- (void)connectionFailed;
@end