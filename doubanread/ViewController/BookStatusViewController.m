#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BookStatusViewController.h"
#import "BookListRequest.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

@implementation BookStatusViewController {
    RefreshHeaderView *refreshHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (refreshHeaderView == nil) {
        refreshHeaderView = [[RefreshHeaderView alloc] initWithFrame:
                CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.bounds.size.width, self.tableView.bounds.size.height)];
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
    for(DOUBook *book in [theBooks reverseObjectEnumerator]){
        if (![books containsObject:book]){
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
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Network connection failed, please try again later" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint pt =scrollView.contentOffset;
    if(pt.y < 0){
        [refreshHeaderView viewDidScroll:scrollView];
    }else if(pt.y > (scrollView.contentSize.height - self.view.bounds.size.height)){
        [refreshFooterView viewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGPoint pt =scrollView.contentOffset;
    if(pt.y < 0){
        [refreshHeaderView viewDidEndDragging:scrollView];
    }else if(pt.y > (scrollView.contentSize.height - self.view.bounds.size.height)){
        [refreshFooterView viewDidEndDragging:scrollView];
    }
}

@end