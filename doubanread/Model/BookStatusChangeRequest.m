#import <libxml/SAX.h>
#import "BookStatusChangeRequest.h"
#import "DOUBookArray.h"
#import "DOUAPIEngine.h"
#import "DOUBook.h"


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

- (void)changeBook:(DOUBook *)book toStatus:(NSString *)status withComment:(NSString *)comment{
    [self doSomethingWithBook:[book id] status:status comment:comment withBlock:^(DOUQuery *query, DOUService *service, NSString *postBody) {
        [service put:query postBody:postBody callback:^(DOUHttpRequest *req) {
            NSError *error = [req doubanError];
            if (!error) {
                [book setComment:comment];
                [delegate performSelector:@selector(bookChangeRequestDidFinish)];
            }
        }];
    }];
}

- (void)addBook:(NSString *)bookId withStatus:(NSString *)status {
    [self doSomethingWithBook:bookId status:status comment:@"" withBlock:^(DOUQuery *query, DOUService *service, NSString *postBody) {
        [service post:query postBody:postBody callback:^(DOUHttpRequest *req) {
            NSError *error = [req doubanError];
            if (!error) {
                [delegate performSelector:@selector(bookChangeRequestDidFinish)];
            } else {
                NSLog(@"error: %@", error);
            }
        }];
    }];
}

- (void)doSomethingWithBook:(NSString *)bookId status:(NSString *)status comment:(NSString *)comment
                  withBlock:(void (^)(DOUQuery *query, DOUService *service, NSString *requestBody))block {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/%@/collection", bookId];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status" : status, @"comment": comment}];

    DOUService *service = [DOUService sharedInstance];
    NSString *body = [NSString stringWithFormat:@"status=%@", status];
    block(query, service, body);
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