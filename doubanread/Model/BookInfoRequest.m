#import "BookInfoRequest.h"
#import "DOUQuery.h"
#import "DOUService.h"
#import "DOUBookArray.h"
#import "DOUAPIEngine.h"
#import "BookStatusViewController.h"


@implementation BookInfoRequest {
    id delegate;
}
- (id)initWithDelegate:(id)aDelegate {
    self = [super init];
    if (self) {
        delegate = aDelegate;
    }
    return self;
}

- (void)retrieveBooks:(NSString *)status {
    [self requestBooksWithDelegateSelector:@selector(bookRequestDidFinish:) parameters:@{@"status" : status, @"count" : @"20"}];
}

- (void)retrieveNewBooks:(NSString *)status {
    [self requestBooksWithDelegateSelector:@selector(newBookRequestDidFinish:) parameters:@{@"status" : status, @"count" : @"20"}];
}

- (void)retrieveMoreBooks:(NSString *)status withStartPoint:(int)startPoint {
    [self requestBooksWithDelegateSelector:@selector(moreBookRequestDidFinish:) parameters:@{@"status" : status, @"count" : @"20", @"start" : [NSString stringWithFormat:@"%i", startPoint]}];
}

- (void)requestBooksWithDelegateSelector:(SEL)delegateSelector parameters:(NSDictionary *)parameters {
    int userId = [[DOUOAuthStore sharedInstance] userId];
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/user/%d/collections", userId];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:parameters];

    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:^(DOUHttpRequest *req) {
        NSString *responseString = [req responseString];
        NSLog(@"str: %@", responseString);
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:responseString];
            if ([delegate respondsToSelector:delegateSelector]) {
                [delegate performSelector:delegateSelector withObject:[array objectArray]];
            }
        }else{
            [delegate connectionFailed];
        }
    }];
}

@end