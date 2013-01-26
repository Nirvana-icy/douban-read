#import "AppDelegate.h"
#import "MainController.h"

@implementation AppDelegate{
    MainController *mainController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    mainController = [[MainController alloc] init];
    self.window.rootViewController = mainController;
    if ([[DOUService sharedInstance] isValid]){
        [mainController loadBooks];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
