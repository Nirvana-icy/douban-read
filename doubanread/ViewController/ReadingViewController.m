#import "ReadingViewController.h"


@implementation ReadingViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"在读";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"reading"];
}

@end