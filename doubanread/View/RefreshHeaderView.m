#import "RefreshHeaderView.h"
#import "RefreshHeaderLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation RefreshHeaderView {
    UILabel *lastUpdatedLabel;
    UILabel *statusLabel;
    CALayer *arrowImage;
    UIActivityIndicatorView *activityView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        [self buildLastUpdatedLabel:frame];
        [self buildStatusLabel:frame];
        [self buildArrayImage:frame];
        [self buildActivityView:frame];
    }
    return self;
}

- (void)buildLastUpdatedLabel:(CGRect)frame {
    lastUpdatedLabel = [[RefreshHeaderLabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, frame.size.width, 20.0f)];
    lastUpdatedLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    [self addSubview:lastUpdatedLabel];
}

- (void)buildStatusLabel:(CGRect)frame{
    statusLabel = [[RefreshHeaderLabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, frame.size.width, 20.0f)];
    statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [self addSubview:statusLabel];
}

- (void)buildArrayImage:(CGRect)frame {
    arrowImage = [[CALayer alloc] init];
    arrowImage.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
    arrowImage.contents = (id)[UIImage imageNamed:@"whiteArrow.png"].CGImage;
    arrowImage.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:arrowImage];
}

- (void)buildActivityView:(CGRect)frame {
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
    [self addSubview:activityView];
}

- (void)viewDidScroll:(UIScrollView *)scrollView {
}

- (void)viewDidEndDragging:(UIScrollView *)scrollView {
}


@end