#import "WishBookDetailView.h"


@implementation WishBookDetailView {
}

- (void)addButtonsWithPositionY:(float)positionY {
    [self createReadingButtonWith:40 and:positionY];
    [self createReadButtonWith:150 and:positionY];
}

@end