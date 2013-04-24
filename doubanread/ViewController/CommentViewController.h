#import <UIKit/UIKit.h>

@class BookDetailViewController;

@interface CommentViewController : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UITextView *commentTextArea;

- (void)setAction:(SEL)action;

- (void)setBookId:(NSString *)string;

- (void)setTarget:(BookDetailViewController *)controller;
@end
