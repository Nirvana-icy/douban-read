#import "ReadingBookDetailView.h"


@implementation ReadingBookDetailView {
    UIButton *finishReadingButton;
    UIButton *wishButton;
}
- (void)addButtonsWithPositionY:(float)positionY {
    finishReadingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishReadingButton setFrame:CGRectMake(30, positionY + 40, 70, 40)];
    [finishReadingButton setTitle:@"读过" forState:UIControlStateNormal];
    [finishReadingButton addTarget:target action:@selector(finishReading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:finishReadingButton];

    wishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [wishButton setFrame:CGRectMake(130, positionY+ 40, 70, 40)];
    [wishButton setTitle:@"想读" forState:UIControlStateNormal];
    [wishButton addTarget:target action:@selector(wishRead) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wishButton];
}

@end