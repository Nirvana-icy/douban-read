#import "BookCell.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"
#import "UIImage+Extension.h"

@implementation BookCell {
    UIImageView *iconView;
    UILabel *titleLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setup];
    return self;
}

- (void)setup {
    iconView = [[UIImageView alloc] init];
    [iconView setFrame:CGRectMake(0, 0, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [self addSubview:iconView];

    titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(IMAGE_MAX_WIDTH + 5, 5, 320 - IMAGE_MAX_WIDTH - 5, 90)];
    [self addSubview:titleLabel];
}

- (void)updateBook:(DOUBook *)theBook {
    UIImage *bookImage = [theBook smallImage];
    [self redrawImage:bookImage];

    [titleLabel updateWithText:[theBook title]
                                   andPosition:CGPointMake(IMAGE_MAX_WIDTH + 5, 5)
                                   andMaxWidth:(320 - IMAGE_MAX_WIDTH - 5)];
    [self setNeedsLayout];
}

- (void)updateImage:(UIImage *)bookImage {
    [self redrawImage:bookImage];
    [self setNeedsLayout];
}

- (void)redrawImage:(UIImage *)bookImage {
    UIImage *cropped = [bookImage cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(0, 0, cropped.size.width, cropped.size.height)];
}

@end