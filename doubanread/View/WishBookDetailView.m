#import "WishBookDetailView.h"


@implementation WishBookDetailView {
    UIButton *finishReadingButton;
    UIButton *readingButton;
}
- (void)addButtonsWithPositionY:(float)positionY {
    readingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [readingButton setFrame:CGRectMake(30, positionY + 40, 70, 40)];
    [readingButton setTitle:@"在读" forState:UIControlStateNormal];
    [readingButton addTarget:target action:@selector(reading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:readingButton];

    finishReadingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishReadingButton setFrame:CGRectMake(130, positionY + 40, 70, 40)];
    [finishReadingButton setTitle:@"读过" forState:UIControlStateNormal];
    [finishReadingButton addTarget:target action:@selector(finishReading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:finishReadingButton];
}

@end