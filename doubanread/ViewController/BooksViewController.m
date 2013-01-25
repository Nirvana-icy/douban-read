#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"
#import "BookCell.h"
#import "BookInfoRequest.h"

@implementation BooksViewController {
     NSMutableArray *books;
    BookInfoRequest *bookInfoRequest;
}

- (id)init {
    self = [super init];
    if (self) {
        books = [[NSMutableArray alloc]init];
        bookInfoRequest = [[BookInfoRequest alloc] initWithDelegate:self];
    }
    return self;
}

- (void)updateWithBooks:(NSArray *)theBooks{
    [books addObjectsFromArray:theBooks];
    [[self tableView] reloadData];
}

- (void)retrieveBooks:(NSString *)status {
    [bookInfoRequest retrieveBooks:status];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [books objectAtIndex:[indexPath row]];
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
    if (!cell) {
        cell = [[BookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCell"];
    }
    [cell setupWithBook: book];
    return cell;
}
@end