#import "ReadingBookDetailView.h"
#import "UILabel+Extension.h"


@implementation ReadingBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {
    UILabel *readingLabel = [[UILabel alloc] initWithText:@"我正在读这本书" andPosition:CGPointMake(15, positionY+10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:readingLabel];

    finishReadingButton = [self createButton:160 positionY:positionY title:@"读过" action:@selector(finishReading)];
    [contentView addSubview:finishReadingButton];
}

@end