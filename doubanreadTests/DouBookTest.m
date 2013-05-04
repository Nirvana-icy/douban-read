#import "DOUBookTest.h"
#import "DOUBook.h"

#define HC_SHORTHAND

#import "OCHamcrestIOS/OCHamcrestIOS.h"

@implementation DOUBookTest

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

- (void)test_should_get_0_when_my_rating_is_nil{
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : @{}}];
    assertThat([book myRating], is(@"0"));
}

- (void)test_should_update_my_rating{
    NSMutableDictionary *ratingValue = [[NSMutableDictionary alloc]init];
    ratingValue[@"value"] = @"1";
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{@"rating" : ratingValue}];
    [book setMyRating:2];
    assertThat([book myRating], is(@"2"));
}

- (void)test_should_set_my_rating_when_my_rating_is_nil{
    DOUBook *book = [[DOUBook alloc] initWithDictionary:@{}];
    [book setMyRating:2];
    assertThat([book myRating], is(@"2"));
}

@end
