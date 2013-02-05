#import "BookDetailView.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"
#import "BookDetailViewController.h"

@implementation BookDetailView {
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
    float height = 10;
    UILabel *bookNameLabel = [[UILabel alloc] initWithText:[book title] andPosition:CGPointMake(110, height) andMaxWidth:200];
    [self addSubview:bookNameLabel];
    height += bookNameLabel.bounds.size.height + 10;

    UILabel *authorLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"作者: %@", [book author]] andPosition:CGPointMake(110, height) andMaxWidth:200];
    [self addSubview:authorLabel];
    height += authorLabel.bounds.size.height + 10;

    if (![[book publisher] isEqual:@""]) {
        UILabel *publisherLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"出版社: %@", [book publisher]] andPosition:CGPointMake(110, height) andMaxWidth:200];
        [publisherLabel setText:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
        [self addSubview:publisherLabel];
        height += publisherLabel.bounds.size.height + 10;
    }

    [self addButtonsWithPositionY:height];
}

- (void)addButtonsWithPositionY:(float)positionY {

}


@end