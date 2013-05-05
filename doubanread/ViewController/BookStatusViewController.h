#import <Foundation/Foundation.h>
#import "BookSmallImageRequestDelegate.h"
#import "BookListViewController.h"
#import "DOUBook.h"

@class DOUBook;


@interface BookStatusViewController : BookListViewController{
    NSString *bookStatus;
}

- (id)initWithBookStatus:(BookStatus)theStatus;

- (void)retrieveBooks;

- (void)retrieveNewBooks;

- (void)retrieveMoreBooks;


- (void)newBookRequestDidFinish:(NSArray *)theBooks;

- (void)connectionFailed;
@end