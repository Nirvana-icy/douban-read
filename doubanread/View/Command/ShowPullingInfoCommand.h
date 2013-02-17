#import <Foundation/Foundation.h>
#import "Command.h"

@interface ShowPullingInfoCommand : NSObject<Command>
+ (id <Command>)command;
@end