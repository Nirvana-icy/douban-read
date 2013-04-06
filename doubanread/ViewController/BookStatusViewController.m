#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BookStatusViewController.h"
#import "BookInfoRequest.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

@implementation BookStatusViewController {
    RefreshHeaderView *refreshHeaderView;
}

- (id)init {
    self = [super init];
    if (self) {
        books = [[NSMutableArray alloc] init];
        bookInfoRequest = [[BookInfoRequest alloc] initWithDelegate:self];
    }
    return self;
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
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

- (void)bookStatusChanged:(DOUBook *)book {
    [books removeObject:book];
    [[self tableView] reloadData];
}

@end