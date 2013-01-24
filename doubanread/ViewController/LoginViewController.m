#import "LoginViewController.h"


@implementation LoginViewController {
    UIButton *loginButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setFrame:CGRectMake(80, 180, 160, 40)];
    [loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
}

- (void)loginButtonPressed {
}
@end