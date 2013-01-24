#import "WishViewController.h"


@implementation WishViewController {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self retrieveBooks:@"wish"];
}

@end