#import "MainController.h"
#import "BookStatusViewController.h"
#import "WebViewController.h"
#import "SearchViewController.h"
#import "StatusUtil.h"

#define kAPIKey @"03aa678cc0ae159a0aff36a6420a40ce"
#define kPrivateKey @"0bed26e34a5bfdec"
#define kRedirectUrl @"http://127.0.0.1"

@implementation MainController {
    WebViewController *webViewController;
    SearchViewController *searchViewController;
    DOUService *service;
    DOUOAuthService *oAuthService;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initDouService];

        searchViewController = [[SearchViewController alloc] init];

        UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        [searchNavigationController.tabBarItem setTitle:@"搜索"];
        [searchNavigationController.tabBarItem setImage:[UIImage imageNamed:@"search"]];

        [self setViewControllers:@[
                [self getControllerWithStatus:READING],
                [self getControllerWithStatus:WISH],
                [self getControllerWithStatus:READ],
                searchNavigationController]
        ];
    }
    return self;
}

- (UINavigationController *)getControllerWithStatus:(BookStatus)bookStatus {
    UINavigationController *readingsNavigationController =
            [[UINavigationController alloc] initWithRootViewController:[[BookStatusViewController alloc] initWithBookStatus:bookStatus]];
    [readingsNavigationController.tabBarItem setTitle:[StatusUtil statusToTitle:bookStatus]];
    [readingsNavigationController.tabBarItem setImage:[UIImage imageNamed:[StatusUtil statusToString:bookStatus]]];
    return readingsNavigationController;
}

- (void)initDouService {
    service = [DOUService sharedInstance];
    service.clientId = kAPIKey;
    service.clientSecret = kPrivateKey;
    service.apiBaseUrlString = kHttpsApiBaseUrl;
}

- (void)viewDidAppear:(BOOL)animated {
    if (![service isValid]) {
        [self initOAuthService];
        webViewController = [[WebViewController alloc] initWithRequestURL:[self oAuthUrl] andOAuthService:oAuthService];
        [self presentViewController:webViewController animated:NO completion:^() {
        }];
    }
}

- (NSURL *)oAuthUrl {
    NSString *str = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code&scope=book_basic_r,book_basic_w,book_basic_common", kAPIKey, kRedirectUrl];
    NSString *urlStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:urlStr];
}

- (void)initOAuthService {
    oAuthService = [DOUOAuthService sharedInstance];
    oAuthService.authorizationURL = kTokenUrl;
    oAuthService.delegate = self;
    oAuthService.clientId = kAPIKey;
    oAuthService.clientSecret = kPrivateKey;
    oAuthService.callbackURL = kRedirectUrl;
}


- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
    [self dismissViewControllerAnimated:NO completion:^{
        [self loadBooks];
    }];
}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
    NSLog(@"login Fail!");
}

- (void)loadBooks {
    UINavigationController *uiNavigationController = [self viewControllers][0];
    UIViewController *viewController = [uiNavigationController viewControllers][0];
    [(BookStatusViewController *) viewController retrieveBooks];
}

@end