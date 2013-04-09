#import <Foundation/Foundation.h>
#import "BookSmallImageRequestDelegate.h"

@class BookInfoRequest;
@class RefreshFooterView;
@class DOUBook;

@interface BookListViewController : UITableViewController <BookSmallImageRequestDelegate> {
    BookInfoRequest *bookInfoRequest;
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