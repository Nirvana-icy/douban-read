#import "MainController.h"
#import "BookStatusViewController.h"
#import "WebViewController.h"
#import "ReadingViewController.h"
#import "WishViewController.h"
#import "ReadViewController.h"
#import "SearchViewController.h"

#define kAPIKey @"03aa678cc0ae159a0aff36a6420a40ce"
#define kPrivateKey @"0bed26e34a5bfdec"
#define kRedirectUrl @"http://127.0.0.1"

@implementation MainController {
    WebViewController *webViewController;
    ReadingViewController *readingViewController;
    WishViewController *wishViewController;
    ReadViewController *readViewController;
    SearchViewController *searchViewController;
    DOUService *service;
    DOUOAuthService *oAuthService;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initDouService];

        readingViewController = [[ReadingViewController alloc] init];
        wishViewController = [[WishViewController alloc] init];
        readViewController = [[ReadViewController alloc] init];
        searchViewController = [[SearchViewController alloc] init];

        UINavigationController *readingsNavigationController = [[UINavigationController alloc] initWithRootViewController:readingViewController];
        [readingsNavigationController.tabBarItem setTitle:@"在读"];
        [readingsNavigationController.tabBarItem setImage:[UIImage imageNamed:@"reading"]];

        UINavigationController *wishNavigationController = [[UINavigationController alloc] initWithRootViewController:wishViewController];
        [wishNavigationController.tabBarItem setTitle:@"想读"];
        [wishNavigationController.tabBarItem setImage:[UIImage imageNamed:@"wish"]];


        UINavigationController *readNavigationController = [[UINavigationController alloc] initWithRootViewController:readViewController];
        [readNavigationController.tabBarItem setTitle:@"读过"];
        [readNavigationController.tabBarItem setImage:[UIImage imageNamed:@"read"]];

        UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        [searchNavigationController.tabBarItem setTitle:@"搜索"];
        [searchNavigationController.tabBarItem setImage:[UIImage imageNamed:@"search"]];

        [self setViewControllers:@[readingsNavigationController, wishNavigationController, readNavigationController, searchNavigationController]];
    }
    return self;
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

- (void)loadBooks{
    [readingViewController retrieveBooks];
}

@end