#import <Foundation/Foundation.h>

@class DOUBook;
@protocol BookMediumImageRequestDelegate;

@interface BookMediumImageRequest : NSObject <NSURLConnectionDataDelegate>
- (id)initWithBook:(DOUBook *)theBook andDelegate:(id <BookMediumImageRequestDelegate>)theDelegate;

- (void)startDownload;
@end