#import "BookInfoRequest.h"
#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBook.h"
#import "DOUAnnotation.h"
#import "DOUAnnotationArray.h"
#import "NSObject+SBJson.h"

@implementation BookInfoRequest {
    id delegate;
    DOUBook *book;
}

- (id)initWithBook:(DOUBook *)aBook andDelegate:(id)aDelegate {
    self = [super init];
    if (self) {
        delegate = aDelegate;
        book = aBook;
    }
    return self;
}

- (void) getReviews{
    DOUService *service = [DOUService sharedInstance];
    NSString *string = [NSString stringWithFormat:@"/v2/book/%@/annotations", [book id]];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:string parameters:nil];
    [service get:query callback:^(DOUHttpRequest *request){
        NSString *responseString = [request responseString];
        NSLog(@"str: %@", responseString);
        NSError *error = [request doubanError];
        NSLog(@"error: %@", error);
        if(!error){
            DOUAnnotationArray *array = [[DOUAnnotationArray alloc] initWithString:responseString];
            for(DOUAnnotation *annotation in [array objectArray]){
                NSLog(@"%@", [annotation abstract]);
                NSLog(@"%@", [annotation chapter]);
                NSLog(@"%@", [annotation pageNum]);
                NSLog(@"%@", [annotation content]);
                NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            }
        }
    }];
}

- (void)getInfo{
    DOUService *service = [DOUService sharedInstance];
    NSString *string = [NSString stringWithFormat:@"/v2/book/%@", [book id]];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:string parameters:nil];
    [service get:query callback:^(DOUHttpRequest *request){
        NSString *responseString = [request responseString];
        NSError *error = [request doubanError];
        if(!error){
            NSMutableDictionary *dic = (NSMutableDictionary *)[responseString JSONValue];
            NSString *summary = [dic objectForKey:@"summary"];
            NSLog(@"summary: %@", summary);
            [book setSummary:summary];
            if([delegate respondsToSelector:@selector(bookInfoRequestDidFinish)]){
                [delegate performSelector:@selector(bookInfoRequestDidFinish)];
            }
        }
    }];
}
@end