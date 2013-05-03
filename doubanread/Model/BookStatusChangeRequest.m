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

- (void)updateBook:(DOUBook *)book{
    [self doSomethingWithBook:book withBlock:^(DOUQuery *query, DOUService *service, NSString *postBody) {
        [service put:query postBody:postBody callback:^(DOUHttpRequest *req) {
            NSError *error = [req doubanError];
            if (!error) {
                [delegate performSelector:@selector(bookChangeRequestDidFinish)];
            } else {
                NSLog(@"error: %@", error);
            }
        }];
    }];
}

- (void)addBook:(DOUBook *)book {
    [self doSomethingWithBook:book withBlock:^(DOUQuery *query, DOUService *service, NSString *postBody) {
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

- (void)doSomethingWithBook:(DOUBook *)book
                  withBlock:(void (^)(DOUQuery *query, DOUService *service, NSString *requestBody))block {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/%@/collection", [book id]];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status" : [book statusString], @"comment": [book myComment], @"rating":@""}];

    DOUService *service = [DOUService sharedInstance];
    NSString *body = [NSString stringWithFormat:@"status=%@", [book statusString]];
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