#import <Foundation/Foundation.h>
#import "Command.h"

@interface ShowNormalInfoCommand : NSObject<Command>
+ (id <Command>)command;
@end