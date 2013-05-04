#import "DOUBookOfSearchResult.h"

@implementation DOUBookOfSearchResult {

}

- (NSString *)rating {
    return self.dictionary[@"rating"][@"average"];
}

- (NSString *)numberOfRaters {
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

- (NSString *)myRating {
    NSString *myRating = self.dictionary[@"current_user_collection"][@"rating"][@"value"];
    if(myRating == nil){
        return @"0";
    }
    return myRating;
}

- (NSString *)myComment {
    NSString *myComment = self.dictionary[@"current_user_collection"][@"comment"];
    if (myComment == nil) {
        return @"";
    }
    return myComment;
}

- (NSString *)publisher {
    return self.dictionary[@"publisher"];
}

- (NSDictionary *)images {
    return [self.dictionary objectForKey:@"images"];
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBookOfSearchResult class]]) {
        return false;
    }

    return [self.id isEqualToString:[(DOUBookOfSearchResult *) object id]];
}

- (NSString *)statusString {
    return self.dictionary[@"current_user_collection"][@"status"];
}

- (void)setStatus:(NSString *)theStatus {
    if (self.dictionary[@"current_user_collection"] == nil) {
        [self.dictionary setObject:[[NSMutableDictionary alloc] init] forKey:@"current_user_collection"];
    } else {
        NSMutableDictionary *currentUserCollection = [[NSMutableDictionary alloc] initWithDictionary:self.dictionary[@"current_user_collection"]];
        self.dictionary[@"current_user_collection"] = currentUserCollection;
    }
    self.dictionary[@"current_user_collection"][@"status"] = theStatus;
}
@end