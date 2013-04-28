#import <Foundation/Foundation.h>

@class BookDetailViewController;

@interface ReadBookActionSheet : UIActionSheet<UIActionSheetDelegate>
- (id)initWithController:(BookDetailViewController *)theController;
@end