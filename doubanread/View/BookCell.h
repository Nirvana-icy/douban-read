#import <Foundation/Foundation.h>

#define IMAGE_MAX_WIDTH 65
#define IMAGE_MAX_HEIGHT 80
@class DOUBook;
@interface BookCell : UITableViewCell

- (void)updateBook:(DOUBook *)theBook;

- (void)updateImage:(UIImage *)bookImage;

@end