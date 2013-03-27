#import <Foundation/Foundation.h>
#import "RefreshHeaderView.h"

@interface RefreshFooterView : UIView

@property id delegate;

@property(nonatomic, strong) UIActivityIndicatorView *activityView;
@property(nonatomic, strong) UILabel *statusLabel;
@property(nonatomic) RefreshState refreshState;

- (id)initWithContainer:(UIScrollView *)theContainer;

- (void)relocate;

- (void)viewDidScroll:(UIScrollView *)scrollView;

- (void)viewDidEndDragging:(UIScrollView *)scrollView;

- (void)dataDidFinishLoading:(UIScrollView *)scrollView;
@end