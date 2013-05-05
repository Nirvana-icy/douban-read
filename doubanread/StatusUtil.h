#import <Foundation/Foundation.h>
#import "DOUBook.h"

@interface StatusUtil : NSObject

+ (NSString *)statusToTitle:(BookStatus) status;

+ (NSString *)statusToString:(BookStatus)status;

+ (NSString *)statusToTip:(BookStatus)status;
@end