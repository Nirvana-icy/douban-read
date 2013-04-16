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
    [iconView setFrame:CGRectMake(10, 10, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [iconView setImage:book.mediumImage];
    [self addSubview:iconView];

    float height = 10;
    UILabel *bookNameLabel = [self createLabelOnTheRightSizeOfImage:height text:[book title]];
    [self addSubview:bookNameLabel];
    height += bookNameLabel.bounds.size.height + 10;

    UILabel *authorLabel = [self createLabelOnTheRightSizeOfImage:height text:[NSString stringWithFormat:@"作者: %@", [book author]]];
    [self addSubview:authorLabel];
    height += authorLabel.bounds.size.height + 10;

    if (![[book publisher] isEqual:@""]) {
        UILabel *publisherLabel = [self createLabelOnTheRightSizeOfImage:height text:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
        [self addSubview:publisherLabel];
        height += publisherLabel.bounds.size.height + 10;
    }

    UILabel *rateLabel = [self createLabelOnTheRightSizeOfImage:height text:[NSString stringWithFormat:@"评分: %@ / %@人评价", [book rating], [book numberOfRaters]]];
    [self addSubview:rateLabel];
    height += rateLabel.bounds.size.height + 10;

    [self addButtonsWithPositionY:IMAGE_MAX_HEIGHT+20];
}

- (UILabel *)createLabelOnTheRightSizeOfImage:(float)height text:(NSString *)text {
    return [[UILabel alloc] initWithText:text andPosition:CGPointMake(130, height) andMaxWidth:200 fontSize:13.0f];
}

- (void)addButtonsWithPositionY:(float)positionY {

}

- (void)showImage:(UIImage *)image {
    UIImage *cropped = [image cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(10, 10, cropped.size.width, cropped.size.height)];
}

- (UIButton *)createButton:(CGFloat)positionX positionY:(CGFloat)positionY title:(NSString *)title action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(positionX, positionY, 70, 40)];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)createReadButtonWith: (CGFloat)positionX and:(CGFloat)positionY  {
    finishReadingButton = [self createButton:positionX positionY:positionY title:@"读过" action:@selector(finishReading)];
    [self addSubview:finishReadingButton];
}

- (void)createWishButtonWith:(CGFloat) positionX and:(CGFloat)positionY {
    wishButton = [self createButton:positionX positionY:positionY title:@"想读" action:@selector(addToWish)];
    [self addSubview:wishButton];
}

- (void)createReadingButtonWith:(CGFloat) positionX and:(CGFloat)positionY {
    readingButton = [self createButton:positionX positionY:positionY title:@"在读" action:@selector(reading)];
    [self addSubview:readingButton];
}

- (void)showSummary {

}
@end