#import "RefreshFooterView.h"
#import "RefreshLabel.h"
#import "ShowNormalInfoCommand.h"
#import "ShowLoadingInfoCommand.h"
#import "ShowPullingInfoCommand.h"
#import "BookStatusViewController.h"

@implementation RefreshFooterView {
    UIScrollView *container;
}

- (id)initWithContainer:(UIScrollView *)theContainer{
    container = theContainer;
    CGRect frame =  CGRectMake(0.0f, container.contentSize.height, container.width, 200);
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1.0];
        [self buildStatusLabel:frame];
        [self buildActivityView];
        [self acceptCommand:[ShowNormalInfoCommand command]];
    }
    return self;
}

- (void)relocate{
    [self setFrame:CGRectMake(0.0f, container.contentSize.height, container.width, 200)];
}

- (void)acceptCommand:(id <Command>)command {
    [command executeFooter:self];
}

- (void)buildStatusLabel:(CGRect)frame {
    _statusLabel = [[RefreshLabel alloc] initWithFrame:CGRectMake(0.0f, 10.0f, frame.size.width, 20.0f)];
    _statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [self addSubview:_statusLabel];
}

- (void)buildActivityView {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.frame = CGRectMake(25.0f, 10.0f, 20.0f, 20.0f);
    [self addSubview:_activityView];
}

- (void)viewDidScroll:(UIScrollView *)scrollView {
    if (!scrollView.isDragging)
        return;
    if (self.refreshState == RefreshLoading) {
        [self createFixedInsetForLoadingInfo:scrollView];
    }
    else if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.height)
            && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.height + 40)) {
        [self acceptCommand:[ShowNormalInfoCommand command]];
    }else if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.height + 40)){
        [self acceptCommand:[ShowPullingInfoCommand command]];
    }
}

- (void)viewDidEndDragging:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.height + 40) && ![self.delegate isLoading]) {
        [self createFixedInsetForLoadingInfo:scrollView];
        [self acceptCommand:[ShowLoadingInfoCommand command]];
        [self.delegate retrieveMoreBooks];
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
    scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 20.0f, 0.0f);
    [UIView commitAnimations];
}

@end