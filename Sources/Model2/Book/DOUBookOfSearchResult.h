#import <Foundation/Foundation.h>
#import "DOUBook.h"

@interface DOUBookOfSearchResult : DOUObject

@property (nonatomic, retain) UIImage *smallImage;
@property (nonatomic, retain) UIImage *mediumImage;
@property (nonatomic, retain) NSString *summary;

- (NSString *)title;

- (NSString *)author;


- (NSString *)id;

- (NSString *)authorIntro;


- (NSString *)publisher;

- (NSString *)smallImageUrl;

- (NSString *)mediumImageUrl;

- (BookStatus)status;
@end