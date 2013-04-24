#import <Foundation/Foundation.h>

@class DOUBook;


@interface BookStatusChangeRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)changeBook:(DOUBook *)bookId toStatus:(NSString *)status withComment:(NSString *)comment1;

- (void)addBook:(NSString *)bookId withStatus:(NSString *)status;

- (void)deleteBook:(NSString *)bookId;


@end