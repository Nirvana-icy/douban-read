#import "BookDetailView.h"
#import "DOUBook.h"
#import "UILabel+Extension.h"
#import "BookDetailViewController.h"
#import "UIImage+Extension.h"

#define IMAGE_MAX_WIDTH 100
#define IMAGE_MAX_HEIGHT 130

@implementation BookDetailView {
    UIImageView *iconView;
    UIWebView *summaryView;
    float totalHeight;
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
    UILabel *bookNameLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[book title]];
    [contentView addSubview:bookNameLabel];
    totalHeight += bookNameLabel.bounds.size.height + 10;

    UILabel *authorLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"作者: %@", [book author]]];
    [contentView addSubview:authorLabel];
    totalHeight += authorLabel.bounds.size.height + 10;

    if (![[book publisher] isEqual:@""]) {
        UILabel *publisherLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"出版社: %@", [book publisher]]];
        [contentView addSubview:publisherLabel];
        totalHeight += publisherLabel.bounds.size.height + 10;
    }

    UILabel *rateLabel = [self createLabelOnTheRightSizeOfImage:totalHeight text:[NSString stringWithFormat:@"评分: %@ / %@人评价", [book rating], [book numberOfRaters]]];
    [contentView addSubview:rateLabel];

    [self addStatusLabelWithPositionY:IMAGE_MAX_HEIGHT+ 40];
    totalHeight = IMAGE_MAX_HEIGHT + 40 + 40;

    if ([book myComment] == nil) {
        UILabel *myCommentLabel = [[UILabel alloc] initWithText:@"我的评价：暂无" andPosition:CGPointMake(15, totalHeight + 5) andMaxWidth:250 fontSize:15.0f];
        [contentView addSubview:myCommentLabel];
        totalHeight += myCommentLabel.bounds.size.height + 15;
    } else {
        UILabel *myCommentLabel = [[UILabel alloc] initWithText:@"我的评价：" andPosition:CGPointMake(15, totalHeight + 5) andMaxWidth:250 fontSize:15.0f];
        [contentView addSubview:myCommentLabel];
        totalHeight += myCommentLabel.bounds.size.height + 10;
        UILabel *myComment = [[UILabel alloc] initWithText:[book myComment] andPosition:CGPointMake(35, totalHeight + 5) andMaxWidth:265 fontSize:15.0f];
        [contentView addSubview:myComment];
        totalHeight += myComment.bounds.size.height + 10;
    }

    UILabel *summaryLabel = [[UILabel alloc] initWithText:@"内容简介: " andPosition:CGPointMake(15, totalHeight + 5) andMaxWidth:200 fontSize:15.0f];
    totalHeight += summaryLabel.bounds.size.height + 10;
    [contentView addSubview:summaryLabel];

    contentView.contentSize = CGSizeMake(320, totalHeight + 110);
    [self addSubview:contentView];
}

- (UILabel *)createLabelOnTheRightSizeOfImage:(float)height text:(NSString *)text {
    return [[UILabel alloc] initWithText:text andPosition:CGPointMake(130, height) andMaxWidth:180 fontSize:13.0f];
}

- (void)addStatusLabelWithPositionY:(float)positionY {

}

- (void)showImage:(UIImage *)image {
    UIImage *cropped = [image cropToWidth:IMAGE_MAX_WIDTH andHeight:IMAGE_MAX_HEIGHT];
    [iconView setImage:cropped];
    [iconView setFrame:CGRectMake(10, 10, cropped.size.width, cropped.size.height)];
}

- (void)showSummary {
    summaryView = [self buildWebViewWith:CGRectMake(9, totalHeight, 300, 1)];
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

    CGRect newFrame = [summaryView frame];
    newFrame.size.height = fittingSize.height + 12;
    [summaryView setFrame:newFrame];
    contentView.contentSize = CGSizeMake(320, contentView.contentSize.height + summaryView.frame.size.height);
}
@end