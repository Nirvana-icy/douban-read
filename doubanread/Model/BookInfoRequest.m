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
    [self requestBooksWithSelector:@selector(bookRequestDidFinish:) andParameters:@{@"status" : status, @"count" : @"20"}];
}

- (void)retrieveNewBooks:(NSString *)status {
    [self requestBooksWithSelector:@selector(newBookRequestDidFinish:) andParameters:@{@"status" : status, @"count" : @"20"}];
}

- (void)retrieveMoreBooks:(NSString *)status withStartPoint:(int)startPoint {
    [self requestBooksWithSelector:@selector(moreBookRequestDidFinish:)
                     andParameters:@{@"status" : status, @"count" : @"20", @"start" : [NSString stringWithFormat:@"%i", startPoint]}];
}


- (void)requestBooksWithSelector:(SEL)selector andParameters:(NSDictionary *)parameters {
    DOUQuery *query= [self queryBookForUser:parameters];
    [self queryBookWith:query andSelector:selector];
}

- (void)searchBooks:(NSString *)key{
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:@"/v2/book/search" parameters:@{@"q":key}];
    [self queryBookWith:query andSelector:@selector(searchBookRequestDidFinish:)];
}

- (void)queryBookWith:(DOUQuery *)query andSelector:(SEL)selector {
    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:^(DOUHttpRequest *req) {
        NSString *responseString = [req responseString];
        NSLog(@"str: %@", responseString);
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:responseString];
            if ([delegate respondsToSelector:selector]) {
                [delegate performSelector:selector withObject:[array objectArray]];
            }
        }else{
            [delegate connectionFailed];
        }
    }];
}

- (DOUQuery *)queryBookForUser:(NSDictionary *)parameters {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/user/%d/collections", [[DOUOAuthStore sharedInstance] userId]];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:parameters];
    return query;
}

@end