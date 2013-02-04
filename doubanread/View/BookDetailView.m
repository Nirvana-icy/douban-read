#import "BookDetailView.h"
#import "DOUBook.h"
#import "DRLabel.h"


@implementation BookDetailView {
    DOUBook *book;
}

- (id)initWithBook:(DOUBook *)theBook {
    self = [super init];
    if (self) {
        book = theBook;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    float height = 10;
    UILabel *authorLabel = [[DRLabel alloc] initWithText:[NSString stringWithFormat:@"作者: %@", [book author]] andPosition:CGPointMake(110, height)];
    [self addSubview:authorLabel];
    height += authorLabel.bounds.size.height;

    UILabel *publisherLabel = [[DRLabel alloc] initWithText:[NSString stringWithFormat:@"出版社: %@", [book publisher]] andPosition:CGPointMake(110, height + 10)];
    [publisherLabel setText:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
    [self addSubview:publisherLabel];
}


@end