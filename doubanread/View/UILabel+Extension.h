#import <Foundation/Foundation.h>

@interface UILabel (Extension)
- (id)initWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth;

- (void)updateWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth;


@end