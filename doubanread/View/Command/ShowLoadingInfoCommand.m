#import <QuartzCore/QuartzCore.h>
#import "ShowLoadingInfoCommand.h"
#import "RefreshHeaderView.h"

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

- (void)execute:(RefreshHeaderView *)refreshHeaderView {
    refreshHeaderView.refreshState = RefreshLoading;
    refreshHeaderView.statusLabel.text = @"Loading...";
    [refreshHeaderView.activityView startAnimating];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    [refreshHeaderView.arrowImage setHidden:YES];
    [CATransaction commit];
}


@end