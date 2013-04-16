#import <Foundation/Foundation.h>

@class DOUBook;

@interface BookInfoRequest : NSObject
- (id)initWithBook:(DOUBook *)aBook andDelegate:(id)aDelegate;

- (void)getReviews;
@end