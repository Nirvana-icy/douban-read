#import <Foundation/Foundation.h>
#import "BookImageRequestDelegate.h"

@class BookInfoRequest;
@class RefreshFooterView;

@interface BookListViewController : UITableViewController <BookImageRequestDelegate> {
    BookInfoRequest *bookInfoRequest;
    NSMutableArray *books;
    RefreshFooterView *refreshFooterView;
    BOOL isLoading;
}
- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;
- (void)reloadData:(int)amount;
- (BOOL)isLoading;
@end