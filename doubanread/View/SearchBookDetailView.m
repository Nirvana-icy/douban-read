#import "SearchBookDetailView.h"

@implementation SearchBookDetailView {

}


- (void)addButtonsWithPositionY:(float)positionY {
    [self createWishButtonWith:40 and:positionY];
    [self createReadingButtonWith:150 and:positionY];
}

@end