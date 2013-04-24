#import <Foundation/Foundation.h>

@interface UIView (Extension)
- (CGFloat)left;

- (void)setLeft:(CGFloat)newLeft;

- (CGFloat)top;

- (void)setTop:(CGFloat)newTop;

- (CGFloat)width;

- (void)setWidth:(CGFloat)newWidth;

- (CGFloat)height;

- (void)setHeight:(CGFloat)newHeight;

- (CGPoint)origin;

- (void)removeAllSubviews;
@end