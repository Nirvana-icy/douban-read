#import <Foundation/Foundation.h>

@class BookDetailViewController;

@interface WishBookActionSheet : UIActionSheet<UIActionSheetDelegate>
- (id)initWithController:(BookDetailViewController *)theController;
@end