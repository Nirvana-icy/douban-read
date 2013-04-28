#import "ReadingBookActionSheet.h"
#import "BookDetailViewController.h"

@implementation ReadingBookActionSheet {
    BookDetailViewController *controller;
}

- (id)initWithController:(BookDetailViewController *)theController {
    self = [super initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"读过", @"删除", nil];
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
            [controller finishReading];
            break;
        case 1:
            [controller deleteBook];
            break;
        default:
            break;
    }
}
@end