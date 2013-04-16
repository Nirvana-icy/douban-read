#import "ReadingBookDetailView.h"


@implementation ReadingBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {

    finishReadingButton = [self createButton:30 positionY:positionY title:@"读过" action:@selector(finishReading)];
    [self addSubview:finishReadingButton];
}

@end