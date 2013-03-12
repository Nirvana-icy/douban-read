#import "BookCell.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"

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
    UIImage *cropped = [self cropImage:bookImage toWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(0, 0, cropped.size.width, cropped.size.height)];
}

- (UIImage *)cropImage:(UIImage *)image toWidth:(int)width andHeight:(int)height {
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    CGFloat cropXStartPoint = 0.0f;
    CGFloat cropYStartPoint = 0.0f;
    if (imageWidth > width) {
        cropXStartPoint = (imageWidth - width) / 2;
    }
    if (imageHeight > height) {
        cropYStartPoint = (imageHeight - height) / 2;
    }
    CGRect rect = CGRectMake(cropXStartPoint, cropYStartPoint, width, height);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);

    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    if(imageRef){
        CFRelease(imageRef);
    }
    return cropped;
}
@end