#import "BookCell.h"
#import "DOUBook.h"

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

    CGSize constSize = {320 - IMAGE_MAX_WIDTH - 5, 9999};
    UIFont *systemFontOfSize = [UIFont systemFontOfSize:16.0f];
    CGSize labelSize = [[theBook title] sizeWithFont:systemFontOfSize constrainedToSize:constSize lineBreakMode:NSLineBreakByWordWrapping];

    [titleLabel setFrame:CGRectMake(IMAGE_MAX_WIDTH + 5, 5, labelSize.width, labelSize.height)];
    titleLabel.font = systemFontOfSize;
    [titleLabel setText:[theBook title]];
    [titleLabel setNumberOfLines:0];
    [self setNeedsLayout];
}

- (void)updateImage:(UIImage *)bookImage {
    [self redrawImage:bookImage];
    [self setNeedsLayout];
}

- (void)redrawImage:(UIImage *)bookImage {
    CGFloat imageWidth = bookImage.size.width;
    CGFloat imageHeight = bookImage.size.height;
    CGFloat cropXStartPoint = 0.0f;
    CGFloat cropYStartPoint = 0.0f;
    if (imageWidth > IMAGE_MAX_WIDTH) {
        cropXStartPoint = (imageWidth - IMAGE_MAX_WIDTH) / 2;
    }
    if (imageHeight > IMAGE_MAX_HEIGHT) {
        cropYStartPoint = (imageHeight - IMAGE_MAX_HEIGHT) / 2;
    }
    CGRect rect = CGRectMake(cropXStartPoint, cropYStartPoint, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT);
    CGImageRef imageRef = CGImageCreateWithImageInRect([bookImage CGImage], rect);

    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(0, 0, cropped.size.width, cropped.size.height)];
}
@end