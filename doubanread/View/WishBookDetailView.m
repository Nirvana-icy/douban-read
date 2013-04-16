#import "WishBookDetailView.h"


@implementation WishBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {
    readingButton = [self createButton:40 positionY:positionY title:@"在读" action:@selector(reading)];
    [self addSubview:readingButton];
    finishReadingButton = [self createButton:150 positionY:positionY title:@"读过" action:@selector(finishReading)];
    [self addSubview:finishReadingButton];
}

@end