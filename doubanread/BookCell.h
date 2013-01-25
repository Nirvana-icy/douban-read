#import <Foundation/Foundation.h>

@class DOUBook;
@interface BookCell : UITableViewCell
- (void)setupWithBook:(DOUBook *)theBook;

- (void)updateBook:(DOUBook *)theBook;

- (void)updateImage:(UIImage *)bookImage;

@end