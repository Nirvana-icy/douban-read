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
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 20 + 10, 10, 20, 20)];
        [button setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

@end
