#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DOUOAuthService;

@interface WebViewController : UIViewController <UIWebViewDelegate>
- (id)initWithRequestURL:(NSURL *)aURL andOAuthService:(DOUOAuthService *)aOAuthService;

@end