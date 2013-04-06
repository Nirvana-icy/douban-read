#import "SearchResultViewController.h"
#import "BookInfoRequest.h"

@implementation SearchResultViewController {

}

- (id)init {
    self = [super init];
    if(self){
        self.navigationItem.title = @"搜索结果";
    }
    return self;
}

- (void)searchBooksWithKeyword:(NSString *)keyword {
    [self startLoadingAnimation];
    [bookInfoRequest searchBooks:keyword];
}

@end