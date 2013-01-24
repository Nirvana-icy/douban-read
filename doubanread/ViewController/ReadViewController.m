#import "ReadViewController.h"


@implementation ReadViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"读过";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"read"];
}


@end