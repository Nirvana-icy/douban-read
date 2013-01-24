#import "ReadViewController.h"


@implementation ReadViewController {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"read"];
}


@end