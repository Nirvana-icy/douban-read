#import <QuartzCore/QuartzCore.h>
#import "ShowPullingInfoCommand.h"
#import "RefreshHeaderView.h"

@implementation ShowPullingInfoCommand

+ (id <Command>)command {
    static ShowPullingInfoCommand *command;
    @synchronized (self) {
        if (!command) {
            command = [[ShowPullingInfoCommand alloc] init];
        }
        return command;
    }
}

- (void)execute:(RefreshHeaderView *)refreshHeaderView {
    refreshHeaderView.refreshState = RefreshPulling;
    refreshHeaderView.statusLabel.text = @"Release to refresh...";
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.18f];
    refreshHeaderView.arrowImage.transform = CATransform3DMakeRotation((CGFloat) ((M_PI / 180.0) * 180.0f), 0.0f, 0.0f, 1.0f);
    [CATransaction commit];
}


@end