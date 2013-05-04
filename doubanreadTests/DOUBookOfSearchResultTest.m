#import "DOUBookOfSearchResultTest.h"
#import "DOUBookOfSearchResult.h"

#define HC_SHORTHAND

#import "OCHamcrestIOS/OCHamcrestIOS.h"

@implementation DOUBookOfSearchResultTest {

}

- (void)test_should_get_my_comment {
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{@"current_user_collection" : @{@"comment" : @"theComment"}}];
    assertThat([book myComment], is(@"theComment"));
}

- (void)test_should_get_empty_string_when_my_comment_is_nil {
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{@"current_user_collection" : @{}}];
    assertThat([book myComment], is(@""));
}

- (void)test_should_change_status {
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{@"current_user_collection" : @{@"status" : @"wish"}}];
    [book setStatus:@"reading"];
    assertThat([book statusString], is(@"reading"));
}

- (void)test_should_set_status_when_original_status_is_nil {
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{}];
    [book setStatus:@"reading"];
    assertThat([book statusString], is(@"reading"));
}

- (void)test_set_status_should_not_change_other_values {
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{@"current_user_collection" : @{@"status" : @"wish", @"comment" : @"theComment"}}];
    [book setStatus:@"reading"];
    assertThat([book statusString], is(@"reading"));
    assertThat([book myComment], is(@"theComment"));
}

- (void)test_should_get_0_when_my_rating_is_nil{
    DOUBookOfSearchResult *book = [[DOUBookOfSearchResult alloc] initWithDictionary:@{@"current_user_collection" : @{}}];
    assertThat([book myRating], is(@"0"));
}
@end