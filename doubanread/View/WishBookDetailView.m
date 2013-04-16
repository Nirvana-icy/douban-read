#import "WishBookDetailView.h"
#import "UILabel+Extension.h"


@implementation WishBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {
    UILabel *wishLabel = [[UILabel alloc] initWithText:@"我想读这本书" andPosition:CGPointMake(15, positionY+10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:wishLabel];

    readingButton = [self createButton:200 positionY:positionY title:@"在读" action:@selector(reading)];
    [contentView addSubview:readingButton];
}

@end