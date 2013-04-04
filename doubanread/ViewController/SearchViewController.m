#import "SearchViewController.h"

@implementation SearchViewController {
    UISearchBar *searchBar;
    UITableView *theTableView;
}

- (id)init{
    self = [super init];
    if(self){
        self.navigationItem.title = @"搜索";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    theTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    theTableView.dataSource = self;
    theTableView.delegate = self;
    [self.view addSubview:theTableView];

    searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    searchBar.placeholder = @"搜索图书";
    searchBar.delegate = self;
    [searchBar sizeToFit];

    [theTableView addSubview:searchBar];

    theTableView.scrollIndicatorInsets = UIEdgeInsetsMake(CGRectGetHeight(searchBar.bounds), 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end