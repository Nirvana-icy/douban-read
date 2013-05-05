#import "DOUBookRatingStarTest.h"
#import "DOUBook.h"
#define HC_SHORTHAND

#import "OCHamcrestIOS/OCHamcrestIOS.h"

@implementation DOUBookRatingStarTest {

}


- (void)test_should_get_stars_when_rating_is_0 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"0"}}}];
    NSArray *rating = @[@0, @0, @0, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_below_1 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"0.9"}}}];
    NSArray *rating = @[@1, @0, @0, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_1_and_2 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"2"}}}];
    NSArray *rating = @[@2, @0, @0, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_2_and_3 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"3"}}}];
    NSArray *rating = @[@2, @1, @0, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_3_and_4 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"4"}}}];
    NSArray *rating = @[@2, @2, @0, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_4_and_5 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"5"}}}];
    NSArray *rating = @[@2, @2, @1, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_5_and_6 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"6"}}}];
    NSArray *rating = @[@2, @2, @2, @0, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_6_and_7 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"7"}}}];
    NSArray *rating = @[@2, @2, @2, @1, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_7_and_8 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"8"}}}];
    NSArray *rating = @[@2, @2, @2, @2, @0];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_8_and_9 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"9"}}}];
    NSArray *rating = @[@2, @2, @2, @2, @1];
    assertThat([book ratingStars], is(rating));
}

- (void)test_should_get_stars_when_rating_between_9_and_10 {
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"book" : @{@"rating" : @{@"average" : @"10"}}}];
    NSArray *rating = @[@2, @2, @2, @2, @2];
    assertThat([book ratingStars], is(rating));
}
@end