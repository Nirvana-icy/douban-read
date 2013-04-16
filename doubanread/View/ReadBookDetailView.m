#import "ReadBookDetailView.h"
#import "UILabel+Extension.h"


@implementation ReadBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {
    UILabel *readingLabel = [[UILabel alloc] initWithText:@"我读过这本书" andPosition:CGPointMake(15, positionY+10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:readingLabel];
}

@end