#import "BookDetailView.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"
#import "BookDetailViewController.h"
#import "UIImage+Extension.h"

#define IMAGE_MAX_WIDTH 100
#define IMAGE_MAX_HEIGHT 130
@implementation BookDetailView {
    UIImageView *iconView;
}

- (id)initWithBook:(DOUBook *)theBook andTarget:(BookDetailViewController *)theTarget {
    self = [super init];
    if (self) {
        book = theBook;
        target = theTarget;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    iconView = [[UIImageView alloc] init];
    [iconView setFrame:CGRectMake(5, 10, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [iconView setImage:book.mediumImage];
    [self addSubview:iconView];

    float height = 10;
    UILabel *bookNameLabel = [[UILabel alloc] initWithText:[book title] andPosition:CGPointMake(120, height) andMaxWidth:200 fontSize:12.0f];
    [self addSubview:bookNameLabel];
    height += bookNameLabel.bounds.size.height + 10;

    UILabel *authorLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"作者: %@", [book author]] andPosition:CGPointMake(120, height) andMaxWidth:200 fontSize:12.0f];
    [self addSubview:authorLabel];
    height += authorLabel.bounds.size.height + 10;

    if (![[book publisher] isEqual:@""]) {
        UILabel *publisherLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"出版社: %@", [book publisher]] andPosition:CGPointMake(120, height) andMaxWidth:200 fontSize:12.0f];
        [publisherLabel setText:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
        [self addSubview:publisherLabel];
    }

    [self addButtonsWithPositionY:IMAGE_MAX_HEIGHT + 20];
}

- (void)addButtonsWithPositionY:(float)positionY {

}

- (void)showImage:(UIImage *)image {
    UIImage *cropped = [image cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(5, 10, cropped.size.width, cropped.size.height)];
}
@end