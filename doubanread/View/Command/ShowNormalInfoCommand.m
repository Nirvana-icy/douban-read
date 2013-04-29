#import <QuartzCore/QuartzCore.h>
#import "ShowNormalInfoCommand.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

@implementation ShowNormalInfoCommand

+ (id <Command>)command {
    static ShowNormalInfoCommand *command;
    @synchronized (self) {
        if (!command) {
            command = [[ShowNormalInfoCommand alloc] init];
        }
        return command;
    }
}

- (void)executeHeader:(RefreshHeaderView *)refreshHeaderView {
    refreshHeaderView.refreshState = RefreshNormal;
    refreshHeaderView.statusLabel.text = @"下拉刷新";
    [refreshHeaderView.activityView stopAnimating];

    [self hideArrow:refreshHeaderView];

    [self showLastUpdatedTime:refreshHeaderView];
}

- (void)showLastUpdatedTime:(RefreshHeaderView *)refreshHeaderView {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setAMSymbol:@"AM"];
    [formatter setPMSymbol:@"PM"];
    [formatter setDateFormat:@"MM/dd/yyyy hh:mm"];
    refreshHeaderView.lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新于: %@", [formatter stringFromDate:date]];
}

- (void)hideArrow:(RefreshHeaderView *)refreshHeaderView {
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    refreshHeaderView.arrowImage.hidden = NO;
    refreshHeaderView.arrowImage.transform = CATransform3DIdentity;
    [CATransaction commit];
}

- (void)executeFooter:(RefreshFooterView *)refreshFooterView {
    refreshFooterView.refreshState = RefreshNormal;
    refreshFooterView.statusLabel.text = @"载入更多...";
    [refreshFooterView.activityView stopAnimating];
    [refreshFooterView relocate];
}


@end