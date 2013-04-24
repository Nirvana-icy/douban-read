@implementation UIView (Extension)


- (CGFloat)left
{
    return [self frame].origin.x;
}

- (void)setLeft:(CGFloat)newLeft
{
    CGRect frameRect = [self frame];
    frameRect.origin.x = newLeft;
    [self setFrame:frameRect];
}

- (CGFloat)top
{
    return [self frame].origin.y;
}


- (void)setTop:(CGFloat)newTop
{
    CGRect frameRect = [self frame];
    frameRect.origin.y = newTop;
    [self setFrame:frameRect];
}


- (CGFloat)width
{
    return [self frame].size.width;
}


- (void)setWidth:(CGFloat)newWidth
{
    CGRect frameRect = [self frame];
    frameRect.size.width = newWidth;
    [self setFrame:frameRect];
}


- (CGFloat)height
{
    return [self frame].size.height;
}


- (void)setHeight:(CGFloat)newHeight
{
    CGRect frameRect = [self frame];
    frameRect.size.height = newHeight;
    [self setFrame:frameRect];
}


- (CGPoint)origin
{
    return [self frame].origin;
}


- (void)removeAllSubviews
{
    while ([[self subviews] count])
    {
        UIView *child = [[self subviews] lastObject];
        [child removeFromSuperview];
    }
}


@end