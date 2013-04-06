#import <Foundation/Foundation.h>
#import "DOUBook.h"

@interface DOUBookOfSearchResult : DOUObject

@property (nonatomic, retain) UIImage *smallImage;

- (NSString *)title;

- (NSString *)author;


- (NSString *)id;

- (NSString *)authorIntro;


- (NSString *)publisher;

- (NSString *)smallImageUrl;

- (BookStatus)status;
@end