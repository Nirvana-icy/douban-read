#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "BooksViewController.h"

@implementation BooksViewController {
     NSMutableArray *books;
}

- (id)init {
    self = [super init];
    if (self) {
        books = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)retrieveBooks:(NSString *)status {
    if ([books count] != 0){
        return;
    }
    NSString *subPath = @"/v2/book/user/dearwolf/collections";
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status": status, @"count": @"100"}];

    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:^(DOUHttpRequest *req){
        NSString *responseString = [req responseString];
        NSLog(@"str:%@", responseString);
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:responseString];
            [books addObjectsFromArray:[array objectArray]];
        }
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [books objectAtIndex:[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [book title]];
    return cell;
}
@end