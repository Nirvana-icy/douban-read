#import "DOUBookTest.h"
#import "DOUBook.h"

#define HC_SHORTHAND

#import "OCHamcrestIOS/OCHamcrestIOS.h"

@implementation DOUBookTest

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
