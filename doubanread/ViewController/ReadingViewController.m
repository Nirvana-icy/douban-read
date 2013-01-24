#import "ReadingViewController.h"


@implementation ReadingViewController {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"reading"];
}

@end