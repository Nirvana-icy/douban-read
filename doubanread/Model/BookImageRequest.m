#import "BookImageRequest.h"
#import "BookImageRequestDelegate.h"
#import "DOUBook.h"

@implementation BookImageRequest {
    NSIndexPath *indexPathInTableView;
    id <BookImageRequestDelegate> delegate;
    NSMutableData *download;
    NSURLConnection *theConnection;
    DOUBook *book;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [download appendData:data];
}

- (id)initWithBook:(DOUBook *)theBook andIndexPath:(NSIndexPath *)path andDelegate:(id <BookImageRequestDelegate>)theDelegate {
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
    theConnection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[book smallImageUrl]]] delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    download = nil;
    theConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImage *image = [UIImage imageWithData:download];
    book.smallImage = image;
    [delegate bookImageDidLoad:image forIndexPath:indexPathInTableView];
}


@end