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

- (void)setupWithBook:(DOUBook *)book {
    NSLog(@"book small image: %@", [book smallImageUrl]);

    iconView = [[UIImageView alloc] initWithImage:[book smallImage]];
    [iconView setFrame:CGRectMake(5, 5, 49, 49)];
    [self addSubview:iconView];

    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 5, 320-60, 30)];
    [titleLabel setText:[book title]];
    [self addSubview:titleLabel];
}
@end