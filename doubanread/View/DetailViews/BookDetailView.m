#import "BookDetailView.h"
#import "DOUBook.h"
#import "BookDetailViewController.h"
#import "ReadBookActionSheet.h"

#define IMAGE_MAX_WIDTH 100
#define IMAGE_MAX_HEIGHT 130

@implementation BookDetailView {
    UIImageView *iconView;
    UIWebView *summaryView;
    float totalHeight;
    UILabel *myComment;
    UILabel *summaryLabel;
    UILabel *statusTipLabel;
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
    contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];

    iconView = [[UIImageView alloc] init];
    [iconView setFrame:CGRectMake(10, 10, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT)];
    [iconView setImage:book.mediumImage];
    [contentView addSubview:iconView];

    totalHeight = 10;
    UILabel *bookNameLabel = [self createLabelOnTheRightSizeOfImage:totalHeight textWithLargeFont:[book title]];
    [contentView addSubview:bookNameLabel];
    totalHeight += bookNameLabel.height + 10;

    UILabel *authorLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"作者: %@", [book author]]];
    [contentView addSubview:authorLabel];
    totalHeight += authorLabel.height + 10;

    if (![[book publisher] isEqual:@""]) {
        UILabel *publisherLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
        [contentView addSubview:publisherLabel];
        totalHeight += publisherLabel.height + 10;
    }

    UILabel *rateLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"评分: "]];
    [contentView addSubview:rateLabel];

    float ratingStartX = 130 + rateLabel.width + 2;

    NSMutableArray *ratingStarArray = [self createStarsWithPosition:ratingStartX y:totalHeight - 2 ratingStars:[book ratingStars]];

    for (UIImageView *imageView in ratingStarArray) {
        [contentView addSubview:imageView];
    }

    [self addStatusLabelWithPositionY:IMAGE_MAX_HEIGHT+ 20];
    totalHeight = IMAGE_MAX_HEIGHT + 20 + 40;

    UILabel *myCommentLabel = [[UILabel alloc] initWithText:@"我的评价: " andPosition:CGPointMake(15, totalHeight + 5) andMaxWidth:250 fontSize:15.0f];
    [contentView addSubview:myCommentLabel];

    float myRatingStartX = myCommentLabel.left + myCommentLabel.width + 2;
    NSMutableArray *myRatingStarArray = [self createStarsWithPosition:myRatingStartX y:totalHeight + 5 ratingStars:[book myRatingStars]];

    for (UIImageView *imageView in myRatingStarArray) {
        [contentView addSubview:imageView];
    }

    totalHeight += myCommentLabel.height + 10;

    myComment = [[UILabel alloc] initWithText:@"暂无" andPosition:CGPointMake(35, totalHeight + 10) andMaxWidth:265 fontSize:15.0f];
    [contentView addSubview:myComment];

    totalHeight += myComment.height + 10;

    summaryLabel = [[UILabel alloc] initWithText:@"内容简介: " andPosition:CGPointMake(15, totalHeight + 10) andMaxWidth:200 fontSize:15.0f];
    totalHeight += summaryLabel.height + 10;
    [contentView addSubview:summaryLabel];

    contentView.contentSize = CGSizeMake(320, totalHeight + 110);
    [self addSubview:contentView];
    [self showCommentAndUpdateStatus];
}

- (NSMutableArray *)createStarsWithPosition:(float)x y:(float)y ratingStars:(NSMutableArray *)ratingStars {
    NSMutableArray *ratingStarArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self getStarName:i ratingStars:ratingStars]]];
        [imageView setFrame:CGRectMake(x, y, 18, 18)];
        x += imageView.width + 3;
        [ratingStarArray addObject:imageView];
    }
    return ratingStarArray;
}

- (NSString *)getStarName:(NSUInteger)starPosition ratingStars:(NSMutableArray *)ratingStars {
    NSArray *stars = ratingStars;
    switch ([stars[starPosition] integerValue]) {
        case 0:
            return @"star_none.png";
        case 1:
            return @"star_half.png";
        case 2:
            return @"star.png";
        default:
            return @"star.png";
    }
}

- (UILabel *)createLabelOnTheRightSizeOfImage:(float)height textWithLargeFont:(NSString *)text {
    return [[UILabel alloc] initWithText:text andPosition:CGPointMake(130, height) andMaxWidth:180 fontSize:15.0f];
}

- (UILabel *)createLabelOnTheRightSizeOfImage:(float)height text:(NSString *)text {
    return [[UILabel alloc] initWithText:text andPosition:CGPointMake(130, height) andMaxWidth:180 fontSize:13.0f];
}

- (void)addStatusLabelWithPositionY:(float)positionY {
    statusTipLabel = [[UILabel alloc] initWithText:[book statusTip] andPosition:CGPointMake(15, positionY + 10) andMaxWidth:200 fontSize:15.0f];
    [contentView addSubview:statusTipLabel];
}

- (void)showImage:(UIImage *)image {
    UIImage *cropped = [image cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(10, 10, cropped.size.width, cropped.size.height)];
}

- (void)showSummary {
    summaryView = [self buildWebViewWith:CGRectMake(9, totalHeight + 5, 300, 1)];
    [summaryView setDelegate:self];
    [contentView addSubview:summaryView];
}

- (UIWebView *)buildWebViewWith:(CGRect)frame {
    NSString *htmlBegin = [NSString stringWithFormat:@"<html><header><style>body{font-family:HelveticaNeue;color:#000000;font-size:14px;}</style></header><body><div>"];
    NSString *htmlEnd = @"</div></body></html>";
    NSString *htmlString = [NSString stringWithFormat:@"%@%@%@", htmlBegin, [book summary], htmlEnd];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    [webView loadHTMLString:htmlString baseURL:nil];
    [webView setUserInteractionEnabled:NO];
    [webView setOpaque:NO];
    [webView setBackgroundColor:[UIColor clearColor]];
    return webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    [aWebView setScalesPageToFit:YES];
    [summaryView setHeight:fittingSize.height + 12];
    contentView.contentSize = CGSizeMake(320, contentView.contentSize.height + summaryView.height);
}

- (void)showCommentAndUpdateStatus {
    [statusTipLabel updateWithText:[book statusTip] andPosition:[statusTipLabel origin] andMaxWidth:200 fontSize:15.0f];
    if ([book myComment] == nil) {
        [myComment updateWithText:@"暂无" andPosition:myComment.origin andMaxWidth:265 fontSize:15.0f];
    } else {
        [myComment updateWithText:[book myComment] andPosition:myComment.origin andMaxWidth:265 fontSize:15.0f];
    }

    [summaryLabel setTop:myComment.top + myComment.height + 15];
    if (summaryView == nil) {
        totalHeight += myComment.height - 15;
    } else {
        [summaryView setTop:summaryLabel.top + summaryLabel.height + 10];
    }
}


- (void)showActionSheet {
    switch ([book status]) {
        case READING:
            [[ReadBookActionSheet alloc] initWithController:target];
            break;
        case WISH:
            [[ReadBookActionSheet alloc] initWithController:target];
            break;
        case READ:
             [[ReadBookActionSheet alloc] initWithController:target];
            break;
        case NOTADDED:
             [[ReadBookActionSheet alloc] initWithController:target];
            break;
    }
}

@end