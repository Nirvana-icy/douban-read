#import <UIKit/UIKit.h>

@class BookDetailViewController;
@class DOUBook;
@class CommentStarView;

@interface CommentViewController : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UITextView *commentTextArea;

- (void)setAction:(SEL)action;

- (void)setBook:(DOUBook *)theBook;

- (void)setTarget:(BookDetailViewController *)controller;
@end
