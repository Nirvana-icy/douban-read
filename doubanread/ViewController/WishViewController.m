#import "WishViewController.h"


@implementation WishViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"想读";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"wish"];
}

@end