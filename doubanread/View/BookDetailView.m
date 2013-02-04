#import "BookDetailView.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"

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
    UILabel *authorLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"作者: %@", [book author]] andPosition:CGPointMake(110, height) andMaxWidth:200];
    [self addSubview:authorLabel];
    height += authorLabel.bounds.size.height;

    UILabel *publisherLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"出版社: %@", [book publisher]] andPosition:CGPointMake(110, height + 10) andMaxWidth:200];
    [publisherLabel setText:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
    [self addSubview:publisherLabel];
}


@end