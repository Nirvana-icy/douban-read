#import "DRLabel.h"


@implementation DRLabel {

}

- (id)initWithText:(NSString *)text andPosition:(CGPoint)position {
    CGSize constSize = {200, 9999};
    UIFont *systemFontOfSize = [UIFont systemFontOfSize:16.0f];
    CGSize labelSize = [text sizeWithFont:systemFontOfSize constrainedToSize:constSize lineBreakMode:NSLineBreakByWordWrapping];

    self = [[UILabel alloc] initWithFrame:CGRectMake(position.x, position.y, labelSize.width, labelSize.height)];
    if (self != nil) {
        [self setNumberOfLines:0];
        [self setFont:systemFontOfSize];
        [self setText:text];
    }
    return self;
}

@end