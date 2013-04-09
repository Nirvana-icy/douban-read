#import <Foundation/Foundation.h>

@class DOUBook;
@class BookDetailViewController;

@interface BookDetailView : UIView{
    DOUBook *book;
    BookDetailViewController *target;
}
- (id)initWithBook:(DOUBook *)theBook andTarget:(BookDetailViewController *)theTarget;

- (void)addButtonsWithPositionY:(float)positionY;

- (void)showImage:(UIImage *)image;
@end