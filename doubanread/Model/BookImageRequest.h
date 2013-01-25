#import <Foundation/Foundation.h>

@class DOUBook;
@protocol BookImageRequestDelegate;

@interface BookImageRequest : NSObject <NSURLConnectionDataDelegate>
- (id)initWithBook:(DOUBook *)theBook andIndexPath:(NSIndexPath *)path andDelegate:(id <BookImageRequestDelegate>)theDelegate;

- (void)startDownload;


@end