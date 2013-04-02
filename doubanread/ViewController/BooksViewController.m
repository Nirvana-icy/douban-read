#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"
#import "BookCell.h"
#import "BookInfoRequest.h"
#import "BookImageRequest.h"
#import "BookDetailViewController.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

@implementation BooksViewController {
    NSMutableArray *books;
    BookInfoRequest *bookInfoRequest;
    RefreshHeaderView *refreshHeaderView;
    RefreshFooterView *refreshFooterView;
    BOOL isLoading;
    UIActivityIndicatorView *spinner;
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

- (void)startLoadingAnimation {
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(150, 200);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
}

- (void)stopLoadingAnimation {
    dispatch_async(dispatch_get_main_queue(), ^(){
        [spinner stopAnimating];
    });
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

- (void)bookRequestDidFinish:(NSArray *)theBooks {
    [books addObjectsFromArray:theBooks];
    [self stopLoadingAnimation];
    [self reloadData:[theBooks count]];
}


- (void)newBookRequestDidFinish:(NSArray *)theBooks {
    NSLog(@"retrieve new books request did finish");
    for(DOUBook *book in theBooks){
        if (![books containsObject:book]){
            [books insertObject:book atIndex:0];
        }
    }
    isLoading = NO;
    [refreshHeaderView dataDidFinishLoading:self.tableView];
    [self reloadData:[theBooks count]];
}

- (void)moreBookRequestDidFinish:(NSArray *)theBooks{
    NSLog(@"retrieve more books request did finish");
    for(DOUBook *book in theBooks){
        [books addObject:book];
    }
    isLoading = NO;
    [self reloadData:[theBooks count]];
    [refreshFooterView dataDidFinishLoading:self.tableView];
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

- (void)reloadData:(int)amount {
    [[self tableView] reloadData];
    if (amount % 20 == 0){
        if (refreshFooterView == nil) {
            refreshFooterView = [[RefreshFooterView alloc] initWithContainer:self.tableView];
            refreshFooterView.delegate = self;
            [[self tableView] addSubview:refreshFooterView];
        }
    }
}

- (BOOL)isLoading {
    return isLoading;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [books objectAtIndex:(NSUInteger) [indexPath row]];
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] initWithBook:book andBooksViewController:self];
    [self.navigationController pushViewController:bookDetailViewController animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [books objectAtIndex:(NSUInteger) [indexPath row]];
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
    if (!cell) {
        cell = [[BookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCell"];
    }
    [cell updateBook:book];

    if (![book smallImage]) {
        BookImageRequest *request = [[BookImageRequest alloc] initWithBook:book andIndexPath:indexPath andDelegate:self];
        [request startDownload];
    }
    return cell;
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

- (void)bookImageDidLoad:(UIImage *)image forIndexPath:(NSIndexPath *)path {
    BookCell *cell = (BookCell *) [[self tableView] cellForRowAtIndexPath:path];
    [cell updateImage:image];
}

- (void)bookStatusChanged:(DOUBook *)book {
    [books removeObject:book];
    [[self tableView] reloadData];
}

@end