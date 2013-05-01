#import "CommentStarView.h"
#import "StarUtil.h"

@implementation CommentStarView {
    NSMutableArray *starButtons;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setFrame:CGRectMake(110, 10, 100, 40)];
    }
    return self;
}

- (void)setBook:(DOUBook *)book {
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 20 + 10, 10, 20, 20)];
        [button setBackgroundImage:[UIImage imageNamed:[StarUtil getStarName:(NSUInteger) i ratingStars:[book myRatingStars]]] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

@end
