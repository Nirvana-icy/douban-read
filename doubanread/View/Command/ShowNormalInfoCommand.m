#import <QuartzCore/QuartzCore.h>
#import "ShowNormalInfoCommand.h"
#import "RefreshHeaderView.h"

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

- (void)execute:(RefreshHeaderView *)refreshHeaderView {
    refreshHeaderView.refreshState = RefreshNormal;

    refreshHeaderView.statusLabel.text = @"Pull down to refresh";
    [refreshHeaderView.activityView stopAnimating];
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    refreshHeaderView.arrowImage.hidden = NO;
    refreshHeaderView.arrowImage.transform = CATransform3DIdentity;
    [CATransaction commit];

    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setAMSymbol:@"AM"];
    [formatter setPMSymbol:@"PM"];
    [formatter setDateFormat:@"MM/dd/yyyy hh:mm"];
    refreshHeaderView.lastUpdatedLabel.text = [NSString stringWithFormat:@"Last Updated: %@", [formatter stringFromDate:date]];
}

@end