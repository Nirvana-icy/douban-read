#import <Foundation/Foundation.h>

@class BookDetailViewController;

@interface ReadingBookActionSheet : UIActionSheet <UIActionSheetDelegate>
- (id)initWithController:(BookDetailViewController *)theController;
@end