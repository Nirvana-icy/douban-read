#import <Foundation/Foundation.h>
#import "DOUAPIEngine.h"


@interface MainController : UITabBarController <DOUOAuthServiceDelegate>
- (void)loadBooks;

@end