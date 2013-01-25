#import <Foundation/Foundation.h>


@interface BookInfoRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)retrieveBooks:(NSString *)status;

@end