#import <Foundation/Foundation.h>

#define MAX_WIDTH 65
#define MAX_HEIGHT 90
@class DOUBook;
@interface BookCell : UITableViewCell
- (void)setupWithBook:(DOUBook *)theBook;

- (void)updateBook:(DOUBook *)theBook;

- (void)updateImage:(UIImage *)bookImage;

@end