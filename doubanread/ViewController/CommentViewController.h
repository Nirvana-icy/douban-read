#import <UIKit/UIKit.h>

@class BookDetailViewController;
@class DOUBook;

@interface CommentViewController : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UITextView *commentTextArea;

- (void)setAction:(SEL)action;

- (void)setBook:(DOUBook *)theBook;

- (void)setTarget:(BookDetailViewController *)controller;
@end
