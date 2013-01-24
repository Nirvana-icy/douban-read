#import "WebViewController.h"
#import "NSString+ParseCategory.h"
#import "DOUAPIEngine.h"

#define kRedirectUrl @"http://127.0.0.1"

@implementation WebViewController {
    UIWebView *webView;
    NSURL *requestURL;
    DOUOAuthService *oAuthService;
}


- (id)initWithRequestURL:(NSURL *)aURL andOAuthService:(DOUOAuthService *)aOAuthService {
    self = [super init];
    if (self) {
        requestURL = aURL;
        oAuthService = aOAuthService;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,
            0,
            self.view.bounds.size.width,
            self.view.bounds.size.height - 49)];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    [webView loadRequest:request];
    [self.view addSubview:webView];

}


- (BOOL)           webView:(UIWebView *)theWebView
shouldStartLoadWithRequest:(NSURLRequest *)request
            navigationType:(UIWebViewNavigationType)navigationType {

    NSURL *urlObj = [request URL];
    NSString *url = [urlObj absoluteString];
    NSLog(@"url: %@", url);
    if ([url hasPrefix:kRedirectUrl]) {

        NSString *query = [urlObj query];
        NSMutableDictionary *parsedQuery = [query explodeToDictionaryInnerGlue:@"="
                                                                    outterGlue:@"&"];

        NSString *error = [parsedQuery objectForKey:@"error"];
        if (error) {
            return NO;
        }

        NSString *code = [parsedQuery objectForKey:@"code"];
        oAuthService.authorizationCode = code;
        [oAuthService validateAuthorizationCode];
        return NO;
    }
    return YES;
}
@end
