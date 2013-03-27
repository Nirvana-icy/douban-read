@class RefreshHeaderView;
@class RefreshFooterView;

@protocol Command <NSObject>

- (void)executeHeader:(RefreshHeaderView *)refreshHeaderView;
- (void)executeFooter:(RefreshFooterView *)refreshFooterView;
@end