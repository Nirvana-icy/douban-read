#import "BookSmallImageRequest.h"
#import "BookSmallImageRequestDelegate.h"
#import "DOUBook.h"

@implementation BookSmallImageRequest {
    NSIndexPath *indexPathInTableView;
    id <BookSmallImageRequestDelegate> delegate;
    NSMutableData *download;
    DOUBook *book;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [download appendData:data];
}

- (id)initWithBook:(DOUBook *)theBook andIndexPath:(NSIndexPath *)path andDelegate:(id <BookSmallImageRequestDelegate>)theDelegate {
    self = [super init];
    if (self) {
        book = theBook;
        indexPathInTableView = path;
        delegate = theDelegate;
    }
    return self;
}

- (void)startDownload{
    download = [NSMutableData data];
    [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[book smallImageUrl]]] delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    download = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImage *image = [UIImage imageWithData:download];
    book.smallImage = image;
    [delegate bookImageDidLoad:image forIndexPath:indexPathInTableView];
}


@end