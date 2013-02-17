#import <Foundation/Foundation.h>

@interface RefreshHeaderView : UIView

@property id delegate;
- (void) viewDidScroll:(UIScrollView *)scrollView;
- (void) viewDidEndDragging:(UIScrollView *)scrollView;
@end