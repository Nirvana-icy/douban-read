#import <Foundation/Foundation.h>
#import "BookSmallImageRequestDelegate.h"

@class BookListRequest;
@class RefreshFooterView;
@class DOUBook;

@interface BookListViewController : UITableViewController <BookSmallImageRequestDelegate> {
    BookListRequest *bookInfoRequest;
    NSMutableArray *books;
    RefreshFooterView *refreshFooterView;
    BOOL isLoading;
}

- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;
- (void)reloadData:(int)amount;
- (BOOL)isLoading;
- (void)bookRequestDidFinish:(NSArray *)theBooks;
- (void)moreBookRequestDidFinish:(NSArray *)theBooks;
- (void)bookStatusChanged:(DOUBook *)book;

@end