#import "DOUBookArray.h"
#import "BookDetailViewController.h"
#import "BookImageRequest.h"
#import "DOUBook.h"
#import "BookCell.h"
#import "RefreshFooterView.h"
#import "BookStatusViewController.h"

@implementation BookListViewController {

    UIActivityIndicatorView *spinner;
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

- (void)reloadData:(int)amount {
    [[self tableView] reloadData];
    if (amount % 20 == 0 && amount != 0){
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

- (void)bookImageDidLoad:(UIImage *)image forIndexPath:(NSIndexPath *)path {
    BookCell *cell = (BookCell *) [[self tableView] cellForRowAtIndexPath:path];
    [cell updateImage:image];
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

- (void)bookRequestDidFinish:(NSArray *)theBooks {
    [books addObjectsFromArray:theBooks];
    [self stopLoadingAnimation];
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
@end