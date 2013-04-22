#import "ReadingBookDetailView.h"
#import "UILabel+Extension.h"
#import "BookDetailViewController.h"


@implementation ReadingBookDetailView {
}

- (void)addStatusLabelWithPositionY:(float)positionY {
    UILabel *readingLabel = [[UILabel alloc] initWithText:@"我正在读这本书" andPosition:CGPointMake(15, positionY+10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:readingLabel];
}


- (void)showActionSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles: @"读过", @"删除", nil];
    [sheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [sheet showInView:[[target tabBarController]view]];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [target finishReading];
            break;
        case 1:
            [target deleteBook];
            break;
        default:
            break;
    }
}

@end