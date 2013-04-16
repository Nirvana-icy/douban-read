#import <Foundation/Foundation.h>

@class DOUBook;
@class BookDetailViewController;

@interface BookDetailView : UIView{
    DOUBook *book;
    BookDetailViewController *target;
    UIButton *finishReadingButton;
    UIButton *readingButton;
    UIButton *wishButton;
}
- (id)initWithBook:(DOUBook *)theBook andTarget:(BookDetailViewController *)theTarget;

- (void)addButtonsWithPositionY:(float)positionY;

- (void)showImage:(UIImage *)image;

- (void)createReadButtonWith:(CGFloat)positionX and:(CGFloat)positionY;

- (void)createWishButtonWith:(CGFloat)positionX and:(CGFloat)positionY;

- (void)createReadingButtonWith:(CGFloat)positionX and:(CGFloat)positionY;

- (void)showSummary;
@end