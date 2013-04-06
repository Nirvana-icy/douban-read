#import <Foundation/Foundation.h>
#import "BookListViewController.h"

@interface SearchResultViewController : BookListViewController

- (void)searchBooksWithKeyword:(NSString *)keyword;
@end