#import <Foundation/Foundation.h>

@class DOUBook;
@class BookDetailViewController;

@interface BookDetailView : UIView<UIWebViewDelegate, UIActionSheetDelegate>{
    DOUBook *book;
    BookDetailViewController *target;
    UIScrollView *contentView;
}
- (id)initWithBook:(DOUBook *)theBook andTarget:(BookDetailViewController *)theTarget;

- (void)addLabelWithPositionY:(float)positionY;

- (void)showImage:(UIImage *)image;

- (void)showSummary;
@end