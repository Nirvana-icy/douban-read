#import "StarUtil.h"

@implementation StarUtil {

}
+ (NSString *)getStarName:(NSUInteger)starPosition ratingStars:(NSMutableArray *)ratingStars {
    switch ([ratingStars[starPosition] integerValue]) {
        case 0:
            return @"star_none.png";
        case 1:
            return @"star_half.png";
        case 2:
            return @"star.png";
        default:
            return @"star.png";
    }
}
@end