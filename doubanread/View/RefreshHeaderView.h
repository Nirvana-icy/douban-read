#import <Foundation/Foundation.h>

typedef enum{
    RefreshPulling,
    RefreshNormal,
    RefreshLoading,
} RefreshState;

@interface RefreshHeaderView : UIView

@property id delegate;
@property(nonatomic, strong) UILabel *lastUpdatedLabel;
@property(nonatomic, strong) UILabel *statusLabel;
@property(nonatomic, strong) CALayer *arrowImage;
@property(nonatomic, strong) UIActivityIndicatorView *activityView;
@property(nonatomic) RefreshState refreshState;

- (void)viewDidScroll:(UIScrollView *)scrollView;

- (void)viewDidEndDragging:(UIScrollView *)scrollView;

- (void)dataDidFinishLoading:(UIScrollView *)scrollView;

@end