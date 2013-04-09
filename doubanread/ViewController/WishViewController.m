#import "WishViewController.h"


@implementation WishViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"想读";
        bookStatus = @"wish";
    }
    return self;
}

@end