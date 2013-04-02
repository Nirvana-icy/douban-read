#import "WishViewController.h"


@implementation WishViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"我想读的书";
        bookStatus = @"wish";
    }
    return self;
}

@end