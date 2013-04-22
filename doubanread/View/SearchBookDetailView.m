#import "SearchBookDetailView.h"
#import "BookDetailViewController.h"

@implementation SearchBookDetailView {

}

- (void)showActionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"在读", @"读过", @"删除", nil];
    [sheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [sheet showInView:[[target tabBarController] view]];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [target addToWish];
            break;
        case 1:
            [target addToReading];
            break;
        default:
            break;
    }
}
@end