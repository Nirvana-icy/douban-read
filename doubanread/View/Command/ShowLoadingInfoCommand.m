#import <QuartzCore/QuartzCore.h>
#import "ShowLoadingInfoCommand.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

@implementation ShowLoadingInfoCommand {

}
+ (id <Command>)command {
    static ShowLoadingInfoCommand *command;
    @synchronized (self) {
        if (!command) {
            command = [[ShowLoadingInfoCommand alloc] init];
        }
        return command;
    }
}

- (void)executeHeader:(RefreshHeaderView *)refreshHeaderView {
    refreshHeaderView.refreshState = RefreshLoading;
    refreshHeaderView.statusLabel.text = @"正在载入...";
    [refreshHeaderView.activityView startAnimating];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [refreshHeaderView.arrowImage setHidden:YES];
    [CATransaction commit];
}

- (void)executeFooter:(RefreshFooterView *)refreshFooterView {
    refreshFooterView.refreshState = RefreshLoading;
    refreshFooterView.statusLabel.text = @"正在载入...";
    [refreshFooterView.activityView startAnimating];
}


@end