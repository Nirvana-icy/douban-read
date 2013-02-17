#import "RefreshHeaderLabel.h"

#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]

@implementation RefreshHeaderLabel {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.textAlignment = NSTextAlignmentCenter;
        self.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        self.shadowOffset = CGSizeMake(0.0f, 1.0f);
        self.backgroundColor = [UIColor clearColor];
        self.textColor = TEXT_COLOR;
    }

    return self;
}


@end