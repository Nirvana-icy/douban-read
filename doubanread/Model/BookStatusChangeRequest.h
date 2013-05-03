#import <Foundation/Foundation.h>

@class DOUBook;


@interface BookStatusChangeRequest : NSObject
- (id)initWithDelegate:(id)aDelegate;

- (void)updateBook:(DOUBook *)book;

- (void)addBook:(DOUBook *)book withStatus:(NSString *)status;

- (void)deleteBook:(NSString *)bookId;


@end