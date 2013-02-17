#import "RefreshHeaderView.h"
#import "RefreshHeaderLabel.h"
#import "ShowNormalInfoCommand.h"
#import "ShowPullingInfoCommand.h"
#import "ShowLoadingInfoCommand.h"
#import "BooksViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation RefreshHeaderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:226.0 / 255.0 green:231.0 / 255.0 blue:237.0 / 255.0 alpha:1.0];
        [self buildLastUpdatedLabel:frame];
        [self buildStatusLabel:frame];
        [self buildArrayImage:frame];
        [self buildActivityView:frame];
        [self acceptCommand:[ShowNormalInfoCommand command]];
    }
    return self;
}

- (void)acceptCommand:(id <Command>)command {
    [command execute:self];
}

- (void)buildLastUpdatedLabel:(CGRect)frame {
    _lastUpdatedLabel = [[RefreshHeaderLabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, frame.size.width, 20.0f)];
    _lastUpdatedLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    [self addSubview:_lastUpdatedLabel];
}

- (void)buildStatusLabel:(CGRect)frame {
    _statusLabel = [[RefreshHeaderLabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, frame.size.width, 20.0f)];
    _statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [self addSubview:_statusLabel];
}

- (void)buildArrayImage:(CGRect)frame {
    _arrowImage = [[CALayer alloc] init];
    _arrowImage.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
    _arrowImage.contents = (id) [UIImage imageNamed:@"whiteArrow.png"].CGImage;
    _arrowImage.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:_arrowImage];
}

- (void)buildActivityView:(CGRect)frame {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
    [self addSubview:_activityView];
}

- (void)viewDidScroll:(UIScrollView *)scrollView {
    if (!scrollView.isDragging)
        return;
    if (self.refreshState == RefreshLoading) {
        [self createFixedInsetForLoadingInfo:scrollView];
    }
    else if (scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0) {
        [self acceptCommand:[ShowNormalInfoCommand command]];
    } else if (scrollView.contentOffset.y < -65.0f) {
        [self acceptCommand:[ShowPullingInfoCommand command]];
    }
}

- (void)viewDidEndDragging:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < -65.0f) {
        [self createFixedInsetForLoadingInfo:scrollView];
        [self acceptCommand:[ShowLoadingInfoCommand command]];
        [self.delegate loadMoreBooks];
    }
}

- (void)dataDidFinishLoading:(UIScrollView *)scrollView{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [UIView commitAnimations];

    [self acceptCommand:[ShowNormalInfoCommand command]];
}

- (void)createFixedInsetForLoadingInfo:(UIScrollView *)scrollView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
    offset = MIN(offset, 60);
    scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
    [UIView commitAnimations];
}


@end