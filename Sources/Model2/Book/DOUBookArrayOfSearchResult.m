#import "DOUBookArrayOfSearchResult.h"
#import "DOUBook.h"
#import "DOUBookOfSearchResult.h"

@implementation DOUBookArrayOfSearchResult {

}

+ (Class)objectClass {
    return [DOUBookOfSearchResult class];
}

+ (NSString *)objectName {
    return @"books";
}

@end