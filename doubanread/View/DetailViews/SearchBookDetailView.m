#import "SearchBookDetailView.h"
#import "BookDetailViewController.h"

@implementation SearchBookDetailView {

}

- (void)addStatusLabelWithPositionY:(float)positionY {
    UILabel *readingLabel = [[UILabel alloc] initWithText:@"我尚未添加过这本书" andPosition:CGPointMake(15, positionY+10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:readingLabel];
}

- (void)showActionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"想读", @"在读", @"删除", nil];
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