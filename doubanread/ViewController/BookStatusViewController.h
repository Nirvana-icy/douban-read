#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"
#import "BookListViewController.h"

@class DOUBook;


@interface BookStatusViewController : BookListViewController{
    NSString *bookStatus;
}

- (void)retrieveBooks;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)connectionFailed;
@end