@implementation UILabel (Extension)

- (id)initWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth fontSize:(float)fontSize {
    UIFont *systemFontOfSize = [UIFont systemFontOfSize:fontSize];
    CGSize labelSize= [self calLabelSizeWithText:text maxWidth:maxWidth systemFontOfSize:systemFontOfSize];
    self = [[UILabel alloc] initWithFrame:CGRectMake(position.x, position.y, labelSize.width, labelSize.height)];
    if (self != nil) {
        [self setNumberOfLines:0];
        [self setFont:systemFontOfSize];
        [self setText:text];
    }
    return self;
}

- (void)updateWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth fontSize:(float)fontSize {
    UIFont *systemFontOfSize = [UIFont systemFontOfSize:fontSize];
    CGSize labelSize= [self calLabelSizeWithText:text maxWidth:maxWidth systemFontOfSize:systemFontOfSize];
    [self setFrame:CGRectMake(position.x, position.y, labelSize.width, labelSize.height)];
    [self setNumberOfLines:0];
    [self setFont:systemFontOfSize];
    [self setText:text];
}

- (CGSize)calLabelSizeWithText:(NSString *)text maxWidth:(int)maxWidth systemFontOfSize:(UIFont *)systemFontOfSize {
    CGSize constSize = {maxWidth, 9999};
    CGSize labelSize = [text sizeWithFont:systemFontOfSize constrainedToSize:constSize lineBreakMode:NSLineBreakByWordWrapping];
    return labelSize;
}
@end