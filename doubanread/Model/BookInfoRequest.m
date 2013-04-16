#import "BookInfoRequest.h"
#import "DOUService.h"
#import "DOUQuery.h"
#import "DOUBook.h"
#import "DOUAnnotation.h"
#import "DOUAnnotationArray.h"

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
@end