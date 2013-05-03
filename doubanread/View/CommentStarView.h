#import <UIKit/UIKit.h>
#import "DOUBook.h"

@interface CommentStarView : UIView

- (void)setBook:(DOUBook *)book;

@property(nonatomic, readonly) int rating;
@end
