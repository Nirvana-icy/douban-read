#import "DOUBookOfSearchResult.h"

@implementation DOUBookOfSearchResult {

}

- (NSString *)title {
    return self.dictionary[@"title"];
}

- (NSArray *)authors {
    return self.dictionary[@"author"];
}

- (NSString *)author {
    return [[self authors] componentsJoinedByString:@", "];
}

- (NSString *)id {
    return self.dictionary[@"id"];
}

- (NSString *)authorIntro {
    return self.dictionary[@"author_intro"];
}

- (NSString *)publisher {
    return self.dictionary[@"publisher"];
}

- (NSString *)smallImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"small"];
    }
}

- (NSString *)mediumImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"medium"];
    }
}

- (NSDictionary *)images {
    return [self.dictionary objectForKey:@"images"];
}

- (BookStatus)status {
    NSString *status = self.dictionary[@"status"];
    if ([status isEqualToString:@"wish"]) {
        return WISH;
    } else if ([status isEqualToString:@"reading"]) {
        return READING;
    } else if([status isEqualToString:@"read"]){
        return READ;
    } else{
        return NOTADDED;
    }
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBookOfSearchResult class]]){
        return false;
    }

    return [self.id isEqualToString:[(DOUBookOfSearchResult *)object id]];
}
@end