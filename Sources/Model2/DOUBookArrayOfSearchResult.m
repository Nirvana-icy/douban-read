#import "DOUBookArrayOfSearchResult.h"
#import "DOUBook.h"

@implementation DOUBookArrayOfSearchResult {

}

+ (Class)objectClass {
    return [DOUBook class];
}

+ (NSString *)objectName {
    return @"books";
}

@end