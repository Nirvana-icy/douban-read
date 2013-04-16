#import "SearchBookDetailView.h"

@implementation SearchBookDetailView {

}


- (void)addButtonsWithPositionY:(float)positionY {
    wishButton = [self createButton:40 positionY:positionY title:@"想读" action:@selector(addToWish)];
    [self addSubview:wishButton];
    readingButton = [self createButton:150 positionY:positionY title:@"在读" action:@selector(reading)];
    [self addSubview:readingButton];
}

@end