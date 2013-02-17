#import <Foundation/Foundation.h>
#import "Command.h"

@interface ShowLoadingInfoCommand : NSObject<Command>
+ (id <Command>)command;
@end