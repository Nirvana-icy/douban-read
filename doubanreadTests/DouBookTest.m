#import "DOUBookTest.h"
#import "DOUBook.h"

#define HC_SHORTHAND

#import "OCHamcrestIOS/OCHamcrestIOS.h"

@implementation DOUBookTest


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
