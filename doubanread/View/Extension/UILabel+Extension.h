#import <Foundation/Foundation.h>

@interface UILabel (Extension)
- (id)initWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth fontSize:(float)fontSize;

- (void)updateWithText:(NSString *)text andPosition:(CGPoint)position andMaxWidth:(int)maxWidth fontSize:(float)fontSize;


@end