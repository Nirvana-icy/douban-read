#import "BookStatusChangeRequest.h"
#import "DOUBookArray.h"
#import "DOUAPIEngine.h"


@implementation BookStatusChangeRequest {
    id delegate;
}
- (id)initWithDelegate:(id)aDelegate {
    self = [super init];
    if (self) {
        delegate = aDelegate;
    }
    return self;
}

- (void)changeBook:(NSString *)bookId toStatus:(NSString *)status {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/%@/collection", bookId];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status" : status}];

    DOUService *service = [DOUService sharedInstance];
    NSString *body = [NSString stringWithFormat:@"status=%@", status];
    [service put:query postBody:body callback:^(DOUHttpRequest *req) {
        NSError *error = [req doubanError];
        if (!error) {
            [delegate performSelector:@selector(bookChangeRequestDidFinish)];
        }
    }];
}

- (void)deleteBook:(NSString *)bookId {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/%@/collection", bookId];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];

    DOUService *service = [DOUService sharedInstance];
    [service delete:query callback:^(DOUHttpRequest *req) {
        [delegate performSelector:@selector(bookChangeRequestDidFinish)];
    }];
}
@end