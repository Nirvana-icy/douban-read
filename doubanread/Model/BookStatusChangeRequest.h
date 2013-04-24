#import <Foundation/Foundation.h>


@interface BookStatusChangeRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)changeBook:(NSString *)bookId toStatus:(NSString *)status;

- (void)changeBook:(NSString *)bookId toStatus:(NSString *)status withComment:(NSString *)comment1;

- (void)addBook:(NSString *)bookId withStatus:(NSString *)status;

- (void)deleteBook:(NSString *)bookId;


@end