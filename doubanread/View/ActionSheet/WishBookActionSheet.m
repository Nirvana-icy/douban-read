#import "WishBookActionSheet.h"
#import "BookDetailViewController.h"

@implementation WishBookActionSheet {
    BookDetailViewController *controller;
}

- (id)initWithController:(BookDetailViewController *)theController {
    self = [super initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"在读", @"读过", @"删除",nil];
    if (self) {
        controller = theController;
        [self setActionSheetStyle:UIActionSheetStyleBlackOpaque];
        [self showInView:[[controller tabBarController] view]];
    }
    return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [controller reading];
            break;
        case 1:
            [controller finishReading];
            break;
        case 2:
            [controller deleteBook];
            break;
        default:
            break;
    }
}
@end