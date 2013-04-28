#import <Foundation/Foundation.h>

@class BookDetailViewController;

@interface NotAddedBookActionSheet : UIActionSheet <UIActionSheetDelegate>
- (id)initWithController:(BookDetailViewController *)theController;
@end