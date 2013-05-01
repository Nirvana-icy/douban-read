#import "CommentStarView.h"

@implementation CommentStarView {
    NSMutableArray *starButtons;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self createStarButtons];
    }
    return self;
}

- (void)createStarButtons {
    [self setFrame:CGRectMake(110, 10, 100, 40)];
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 18 + 10, 11, 18, 18)];
        [button setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

@end
