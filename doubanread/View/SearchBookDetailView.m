#import "SearchBookDetailView.h"

@implementation SearchBookDetailView {
    UIButton *readingButton;
    UIButton *wishButton;
}
- (void)addButtonsWithPositionY:(float)positionY {
    readingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [readingButton setFrame:CGRectMake(30, positionY + 40, 70, 40)];
    [readingButton setTitle:@"在读" forState:UIControlStateNormal];
    [readingButton addTarget:target action:@selector(addToReading) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:readingButton];

    wishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [wishButton setFrame:CGRectMake(130, positionY+ 40, 70, 40)];
    [wishButton setTitle:@"想读" forState:UIControlStateNormal];
    [wishButton addTarget:target action:@selector(addToWish) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wishButton];

}
@end