#import "WishBookDetailView.h"
#import "UILabel+Extension.h"
#import "BookDetailViewController.h"


@implementation WishBookDetailView {
}

- (void)addStatusLabelWithPositionY:(float)positionY {
    UILabel *wishLabel = [[UILabel alloc] initWithText:@"我想读这本书" andPosition:CGPointMake(15, positionY + 10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:wishLabel];
}

- (void)showActionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"在读", @"读过", @"删除", nil];
    [sheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [sheet showInView:[[target tabBarController] view]];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [target reading];
            break;
        case 1:
            [target finishReading];
            break;
        case 2:
            [target deleteBook];
            break;
        default:
            break;
    }
}
@end