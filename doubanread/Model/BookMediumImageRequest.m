#import "BookMediumImageRequest.h"
#import "DOUBook.h"
#import "BookMediumImageRequestDelegate.h"

@implementation BookMediumImageRequest {
    id <BookMediumImageRequestDelegate> delegate;
    NSMutableData *download;
    DOUBook *book;
}
- (id)initWithBook:(DOUBook *)theBook andDelegate:(id <BookMediumImageRequestDelegate>)theDelegate {
    self = [super init];
    if (self) {
        book = theBook;
        delegate = theDelegate;
    }
    return self;
}

- (void)startDownload {
    download = [NSMutableData data];
    [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[book mediumImageUrl]]] delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [download appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    download = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImage *image = [UIImage imageWithData:download];
    book.mediumImage = image;
    [delegate bookImageDidLoad:image];
}

@end