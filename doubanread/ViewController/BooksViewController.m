#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"
#import "BookCell.h"
#import "BookInfoRequest.h"
#import "BookImageRequest.h"
#import "BookDetailViewController.h"
#import "RefreshHeaderView.h"

@implementation BooksViewController {
    NSMutableArray *books;
    BookInfoRequest *bookInfoRequest;
    RefreshHeaderView *refreshHeaderView;
    BOOL isLoading;
    NSString *bookStatus;
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

- (void)retrieveBooks:(NSString *)status {
    bookStatus = status;
    [bookInfoRequest retrieveBooks:status];
}

- (void)retrieveMoreBooks {
    isLoading = YES;
    [bookInfoRequest retrieveMoreBooks:bookStatus];
}

- (void)bookRequestDidFinish:(NSArray *)theBooks {
    [books addObjectsFromArray:theBooks];
    [[self tableView] reloadData];
}


- (void)moreBookRequestDidFinish:(NSArray *)theBooks {
    NSLog(@"retrieve more books request did finish");
    for(DOUBook *book in theBooks){
        if (![books containsObject:book]){
            [books insertObject:book atIndex:0];
        }
    }
    isLoading = NO;
    [refreshHeaderView dataDidFinishLoading:self.tableView];
    [[self tableView] reloadData];
}

- (BOOL)isLoading {
    return isLoading;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
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
    [refreshHeaderView viewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [refreshHeaderView viewDidEndDragging:scrollView];
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