#import "CommentStarView.h"
#import "StarUtil.h"

@implementation CommentStarView {
    NSMutableArray *starButtons;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setFrame:CGRectMake(110, 10, 100, 40)];
        starButtons = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setBook:(DOUBook *)book {
    for (int i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 20 + 10, 10, 20, 20)];
        UIImage *image = [UIImage imageNamed:[StarUtil getStarName:(NSUInteger) i ratingStars:[book myRatingStars]]];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(changeStarStatus:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [starButtons addObject:button];
    }
}

- (void)changeStarStatus:(id)sender {
    NSUInteger indexOfObject = [starButtons indexOfObject:sender];
    for (NSUInteger i = 0; i <= indexOfObject; i++) {
        UIButton *button = starButtons[i];
        [button setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateHighlighted];
    }
    for(NSUInteger i = indexOfObject+1; i < [starButtons count]; i ++){
        UIButton *button = starButtons[i];
        [button setBackgroundImage:[UIImage imageNamed:@"star_none.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"star_none.png"] forState:UIControlStateHighlighted];
    }
}

@end
