#define HC_SHORTHAND

#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import "DOUBookMyRatingStarTest.h"
#import "DOUBook.h"
@implementation DOUBookMyRatingStarTest {

}

- (void)test_should_get_my_stars_when_my_rating_is_0 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"0"}}];
    assertThat([book myRatingStars], is(@[@0, @0, @0, @0, @0]));
}

- (void)test_should_get_my_stars_when_my_rating_is_1 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"1"}}];
    assertThat([book myRatingStars], is(@[@2, @0, @0, @0, @0]));
}

- (void)test_should_get_my_stars_when_my_rating_is_2 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"2"}}];
    assertThat([book myRatingStars], is(@[@2, @2, @0, @0, @0]));
}

- (void)test_should_get_my_stars_when_my_rating_is_3 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"3"}}];
    assertThat([book myRatingStars], is(@[@2, @2, @2, @0, @0]));
}

- (void)test_should_get_my_stars_when_my_rating_is_4 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"4"}}];
    assertThat([book myRatingStars], is(@[@2, @2, @2, @2, @0]));
}

- (void)test_should_get_my_stars_when_my_rating_is_5 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{@"value" : @"5"}}];
    assertThat([book myRatingStars], is(@[@2, @2, @2, @2, @2]));
}
@end