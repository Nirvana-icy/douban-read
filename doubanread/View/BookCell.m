#import "BookCell.h"
#import "DOUBook.h"

@interface BookCellBackgroundView : UIView
- (id)initWithColor:(UIColor *)theColor;
@end

@implementation BookCellBackgroundView{
}

- (id)initWithColor:(UIColor *)theColor{
    self = [super init];
    if(self){
        [self setBackgroundColor:theColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}
@end

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
    [iconView setFrame:CGRectMake(5, 10, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [self addSubview:iconView];

    titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(IMAGE_MAX_WIDTH + 20, 10, 320 - IMAGE_MAX_WIDTH - 5, 90)];
    [self addSubview:titleLabel];

    UIColor *color = [UIColor colorWithRed:241.0/255 green:242.0/255 blue:233.0/255 alpha:1.0];
    [self setSelectedBackgroundView:[[BookCellBackgroundView alloc] initWithColor:color]];
}

- (void)updateBook:(DOUBook *)theBook {
    UIImage *bookImage = [theBook smallImage];
    [self redrawImage:bookImage];

    [titleLabel updateWithText:[theBook title] andPosition:CGPointMake(IMAGE_MAX_WIDTH + 20, 10) andMaxWidth:(320 - IMAGE_MAX_WIDTH - 5) fontSize:14.0f];
    [self setNeedsLayout];
}

- (void)updateImage:(UIImage *)bookImage {
    [self redrawImage:bookImage];
    [self setNeedsLayout];
}

- (void)redrawImage:(UIImage *)bookImage {
    UIImage *cropped = [bookImage cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(5, 10, cropped.size.width, cropped.size.height)];
}

@end