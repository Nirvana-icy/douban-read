#import "MainController.h"
#import "LoginViewController.h"
#import "ReadingViewController.h"


@implementation MainController {
    LoginViewController *loginViewController;

    ReadingViewController *readingViewController;
}

- (void)viewDidAppear:(BOOL)animated {
    loginViewController = [[LoginViewController alloc] init];
    [self presentViewController:loginViewController animated:NO completion:^() {
    }];
}

@end