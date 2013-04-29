
#import "CommentStarView.h"

@implementation CommentStarView{
    NSMutableArray *starButtons;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self createStarButtons];
    }
    return self;
}

- (void)createStarButtons{
    [self setFrame:CGRectMake(140, 10, 100, 40)];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 18, 18)];
    [button setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    [self addSubview:button];
}

@end
