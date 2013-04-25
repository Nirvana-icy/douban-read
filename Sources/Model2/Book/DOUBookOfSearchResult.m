#import "DOUBookOfSearchResult.h"

@implementation DOUBookOfSearchResult {

}

- (NSString *)rating{
    return self.dictionary[@"rating"][@"average"];
}

- (NSString *)numberOfRaters{
    return self.dictionary[@"rating"][@"numRaters"];
}

- (NSString *)title {
    return self.dictionary[@"title"];
}

- (NSArray *)authors {
    return self.dictionary[@"author"];
}

- (NSString *)id {
    return self.dictionary[@"id"];
}

- (NSString *)authorIntro {
    return self.dictionary[@"author_intro"];
}

- (NSString *)myComment{
    return self.dictionary[@"comment"];
}

- (NSString *)publisher {
    return self.dictionary[@"publisher"];
}

- (NSDictionary *)images {
    return [self.dictionary objectForKey:@"images"];
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBookOfSearchResult class]]){
        return false;
    }

    return [self.id isEqualToString:[(DOUBookOfSearchResult *)object id]];
}
@end