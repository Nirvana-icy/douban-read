#import "BookCell.h"
#import "DOUBook.h"

@implementation BookCell {
    UIImageView *iconView;
    UILabel *titleLabel;
    UILabel *authorLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setupWithBook:(DOUBook *)theBook {
    iconView = [[UIImageView alloc] initWithImage:[theBook smallImage]];
    [iconView setFrame:CGRectMake(5, 5, 70, 90)];
    [self addSubview:iconView];

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 5, 320 - 80, 30)];
    [titleLabel setText:[theBook title]];
    [self addSubview:titleLabel];
}

- (void)updateBook:(DOUBook *)theBook{
    [self redrawImage:[theBook smallImage]];
    [titleLabel setText:[theBook title]];
    [self setNeedsLayout];
}

- (void)updateImage:(UIImage *)bookImage{
    [self redrawImage:bookImage];
    [self setNeedsLayout];
}

- (void)redrawImage:(UIImage *)bookImage {
    [iconView setImage:bookImage];
    [iconView setBounds:CGRectMake(0, 0, bookImage.size.width, bookImage.size.height)];
}

@end