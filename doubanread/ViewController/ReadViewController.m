#import "ReadViewController.h"


@implementation ReadViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"读过";
        bookStatus = @"read";
    }
    return self;
}

@end