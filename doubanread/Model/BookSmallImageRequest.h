#import <Foundation/Foundation.h>

@class DOUBook;
@protocol BookSmallImageRequestDelegate;

@interface BookSmallImageRequest : NSObject <NSURLConnectionDataDelegate>
- (id)initWithBook:(DOUBook *)theBook andIndexPath:(NSIndexPath *)path andDelegate:(id <BookSmallImageRequestDelegate>)theDelegate;

- (void)startDownload;


@end