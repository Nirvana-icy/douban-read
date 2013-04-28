#import "NotAddedBookActionSheet.h"
#import "BookDetailViewController.h"

@implementation NotAddedBookActionSheet {
    BookDetailViewController *controller;
}

- (id)initWithController:(BookDetailViewController *)theController {
    self = [super initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"想读", @"在读", nil];
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
            [controller addToWish];
            break;
        case 1:
            [controller addToReading];
            break;
        default:
            break;
    }
}
@end