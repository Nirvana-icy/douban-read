@class RefreshHeaderView;

@protocol Command <NSObject>

- (void)execute:(RefreshHeaderView *)refreshHeaderView;

@end