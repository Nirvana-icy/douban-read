#import <Foundation/Foundation.h>

@interface StarUtil : NSObject
+ (NSString *)getStarName:(NSUInteger)starPosition ratingStars:(NSMutableArray *)ratingStars;
@end