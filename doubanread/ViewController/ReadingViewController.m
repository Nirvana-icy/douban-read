#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBookArray.h"
#import "DOUBook.h"
#import "ReadingViewController.h"

@implementation ReadingViewController {
     NSMutableArray *readingBooks;
}

- (id)init {
    self = [super init];
    if (self) {
        readingBooks = [[NSMutableArray alloc]init];
        self.navigationItem.title = @"豆瓣读书";
    }
    return self;
}

- (void)retrieveBooks{
    NSString *subPath = @"/v2/book/user/dearwolf/collections";
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status": @"reading"}];

    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:^(DOUHttpRequest *req){
        NSString *responseString = [req responseString];
        NSLog(@"str:%@", responseString);
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:responseString];
            [readingBooks addObjectsFromArray:[array objectArray]];
        }
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [readingBooks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DOUBook *book = [readingBooks objectAtIndex:[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tweetCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [book title]];
    return cell;
}
@end