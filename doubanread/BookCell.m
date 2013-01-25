#import "BookCell.h"
#import "DOUBook.h"

@implementation BookCell {
    UIImageView *iconView;
    UILabel *titleLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setupWithBook:(DOUBook *)theBook {
    iconView = [[UIImageView alloc] init];
    [iconView setFrame:CGRectMake(0, 0, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [self addSubview:iconView];

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(IMAGE_MAX_WIDTH + 5, 0, 320 - IMAGE_MAX_WIDTH, 30)];
    [titleLabel setText:[theBook title]];
    [self addSubview:titleLabel];
}

- (void)updateBook:(DOUBook *)theBook {
    UIImage *bookImage = [theBook smallImage];
    [self redrawImage:bookImage];
    [titleLabel setText:[theBook title]];
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
    CGImageRef xx = [bookImage CGImage];
    CGImageRef imageRef = CGImageCreateWithImageInRect(xx, rect);


    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(0, 0, cropped.size.width, cropped.size.height)];
}
@end