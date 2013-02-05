#import <Foundation/Foundation.h>


@interface BookStatusChangeRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)changeBook:(NSString *)bookId toStatus:(NSString *)status;


@end