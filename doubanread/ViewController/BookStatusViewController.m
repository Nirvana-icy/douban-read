#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BookStatusViewController.h"
#import "BookListRequest.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"
#import "StatusUtil.h"

@implementation BookStatusViewController {
    RefreshHeaderView *refreshHeaderView;
}


- (id)initWithBookStatus:(BookStatus)theStatus {
    self = [self init];
    if (self) {
        bookStatus = [StatusUtil statusToString:theStatus];
        self.navigationItem.title = [StatusUtil statusToTitle:theStatus];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (refreshHeaderView == nil) {
        refreshHeaderView = [[RefreshHeaderView alloc] initWithFrame:
                CGRectMake(0.0f, 0.0f - self.tableView.height, self.view.width, self.tableView.height)];
        refreshHeaderView.delegate = self;
        [[self tableView] addSubview:refreshHeaderView];
    }
}

- (void)retrieveBooks {
    [self startLoadingAnimation];
    [bookInfoRequest retrieveBooks:bookStatus];
}

- (void)retrieveNewBooks {
    isLoading = YES;
    [bookInfoRequest retrieveNewBooks:bookStatus];
}

- (void)retrieveMoreBooks {
    isLoading = YES;
    [bookInfoRequest retrieveMoreBooks:bookStatus withStartPoint:[books count]];
}

- (void)newBookRequestDidFinish:(NSArray *)theBooks {
    NSLog(@"retrieve new books request did finish");
    for (DOUBook *book in [theBooks reverseObjectEnumerator]) {
        if (![books containsObject:book]) {
            [books insertObject:book atIndex:0];
        }
    }
    isLoading = NO;
    [refreshHeaderView dataDidFinishLoading:self.tableView];
    [self reloadData:[theBooks count]];
}

- (void)connectionFailed {
    NSLog(@"connection failed");
    isLoading = NO;
    [refreshHeaderView dataDidFinishLoading:self.tableView];
    [refreshFooterView dataDidFinishLoading:self.tableView];
    [self stopLoadingAnimation];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络连接失败" message:@"无法建立网络连接，请稍后再试" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint pt = scrollView.contentOffset;
    if (pt.y < 0) {
        [refreshHeaderView viewDidScroll:scrollView];
    } else if (pt.y > (scrollView.contentSize.height - self.view.height)) {
        [refreshFooterView viewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGPoint pt = scrollView.contentOffset;
    if (pt.y < 0) {
        [refreshHeaderView viewDidEndDragging:scrollView];
    } else if (pt.y > (scrollView.contentSize.height - self.view.height)) {
        [refreshFooterView viewDidEndDragging:scrollView];
    }
}

@end