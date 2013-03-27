#import <Foundation/Foundation.h>


@interface BookInfoRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)retrieveBooks:(NSString *)status;

- (void)retrieveNewBooks:(NSString *)status;

- (void)retrieveMoreBooks:(NSString *)string;
@end