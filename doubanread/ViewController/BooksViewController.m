#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"
#import "BookCell.h"
#import "BookInfoRequest.h"
#import "BookImageRequest.h"
#import "BookDetailViewController.h"

@implementation BooksViewController {
    NSMutableArray *books;
    BookInfoRequest *bookInfoRequest;
}

- (id)init {
    self = [super init];
    if (self) {
        books = [[NSMutableArray alloc] init];
        bookInfoRequest = [[BookInfoRequest alloc] initWithDelegate:self];
    }
    return self;
}

- (void)bookRequestDidFinish:(NSArray *)theBooks {
    [books addObjectsFromArray:theBooks];
    [[self tableView] reloadData];
}

- (void)retrieveBooks:(NSString *)status {
    [bookInfoRequest retrieveBooks:status];
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

- (void)bookImageDidLoad:(UIImage *)image forIndexPath:(NSIndexPath *)path {
    BookCell *cell = (BookCell *) [[self tableView] cellForRowAtIndexPath:path];
    [cell updateImage:image];
}

- (void)bookStatusChanged:(DOUBook *)book{
    [books removeObject:book];
    [[self tableView] reloadData];
}

@end