#import "BookStatusChangeRequest.h"
#import "DOUBookArray.h"
#import "DOUAPIEngine.h"
#import "DOUBook.h"


@implementation BookStatusChangeRequest {
    id delegate;

    void (^callBackFunction)(DOUHttpRequest *);
}
- (id)initWithDelegate:(id)aDelegate {
    self = [super init];
    if (self) {
        delegate = aDelegate;
        [self initCallBackFunction];
    }
    return self;
}

- (void)updateBook:(DOUBook *)book {
    [self doSomethingWithBook:book withBlock:^(DOUQuery *query, DOUService *service) {
        [service put:query postBody:@"" callback:callBackFunction];
    }];
}

- (void)addBook:(DOUBook *)book {
    [self doSomethingWithBook:book withBlock:^(DOUQuery *query, DOUService *service) {
        [service post:query postBody:@"" callback:callBackFunction];
    }];
}

- (void)initCallBackFunction {
    callBackFunction = ^(DOUHttpRequest *req) {
        NSError *error = [req doubanError];
        if (!error) {
            [delegate performSelector:@selector(bookChangeRequestDidFinish)];
        } else {
            NSLog(@"error: %@", error);
        }
    };
}

- (void)doSomethingWithBook:(DOUBook *)book
                  withBlock:(void (^)(DOUQuery *query, DOUService *service))block {
    NSString *subPath = [NSString stringWithFormat:@"/v2/book/%@/collection", [book id]];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:@{@"status" : [book statusString], @"comment" : [book myComment], @"rating" : [book myRating]}];
    DOUService *service = [DOUService sharedInstance];
    block(query, service);
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