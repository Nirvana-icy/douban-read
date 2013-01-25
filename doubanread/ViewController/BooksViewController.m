#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"
#import "BookCell.h"
#import "BookInfoRequest.h"
#import "BookImageRequest.h"

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
    DOUBook *book = [books objectAtIndex:[indexPath row]];
    return [book smallImage].size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [books objectAtIndex:[indexPath row]];
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
    if (!cell) {
        cell = [[BookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCell"];
        [cell setupWithBook:book];
    }
    [cell updateBook:book];

    if (![book smallImage]) {
        BookImageRequest *request = [[BookImageRequest alloc] initWithBook:book andIndexPath:indexPath andDelegate:self];
        [request startDownload];
    }
    return cell;
}

- (void)bookImageDidLoad:(UIImage *)image forIndexPath:(NSIndexPath *)path {
    BookCell *cell = [[self tableView] cellForRowAtIndexPath:path];
    [cell updateImage:image];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
}

@end