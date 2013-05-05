//
//  DOUBook.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"
#import "StatusUtil.h"

@implementation DOUBook {
}

- (NSString *)rating {
    return [self book][@"rating"][@"average"];
}

- (NSMutableArray *)ratingStars {
    NSMutableArray *result = [[@[@0, @0, @0, @0, @0] mutableCopy] autorelease];
    float ratingValue = [[self rating] floatValue];
    for (NSUInteger i = 0; i < 5; i++) {
        if (0 == ratingValue) {
            result[i] = @0;
            break;
        }
        else if (0 < ratingValue && ratingValue <= 1) {
            result[i] = @1;
            break;
        }
        else if (1 < ratingValue && ratingValue <= 2) {
            result[i] = @2;
            break;
        }
        ratingValue = ratingValue - 2;
        result[i] = @2;
    }
    return result;
}

- (NSMutableArray *)myRatingStars {
    NSMutableArray *result = [[@[@0, @0, @0, @0, @0] mutableCopy] autorelease];
    float ratingValue = [[self myRating] floatValue];
    for (NSUInteger i = 0; i < 5; i++) {
        if (0 == ratingValue) {
            result[i] = @0;
            break;
        }
        else if (ratingValue == 1) {
            result[i] = @2;
            break;
        }
        ratingValue = ratingValue - 1;
        result[i] = @2;
    }
    return result;
}


- (NSString *)numberOfRaters {
    return [self book][@"rating"][@"numRaters"];
}

- (NSString *)title {
    return [self book][@"title"];
}

- (NSArray *)authors {
    return [self book][@"author"];
}

- (NSString *)author {
    return [[self authors] componentsJoinedByString:@", "];
}

- (NSString *)id {
    return [self book][@"id"];
}

- (NSString *)authorIntro {
    return [self book][@"author_intro"];
}

- (NSString *)publisher {
    return [self book][@"publisher"];
}

- (NSString *)pages {
    return [self book][@"pages"];
}

- (NSString *)price {
    return [self book][@"price"];
}

- (NSString *)publishDate {
    return [self book][@"pubdate"];
}

- (NSString *)myComment {
    NSString *comment = self.dictionary[@"comment"];
    if (comment == nil) {
        return @"";
    }
    return comment;
}

- (void)setComment:(NSString *)comment {
    self.dictionary[@"comment"] = comment;
}

- (NSString *)myRating {
    NSString *rating = self.dictionary[@"rating"][@"value"];
    if (rating == nil) {
        return @"0";
    }
    return rating;
}

- (void)setMyRating:(int)myRating {
    if (self.dictionary[@"rating"] == nil) {
        [self.dictionary setObject:[[[NSMutableDictionary alloc] init] autorelease] forKey:@"rating"];
    } else {
        NSMutableDictionary *currentUserCollection = [[NSMutableDictionary alloc]
                initWithDictionary:self.dictionary[@"rating"]];
        self.dictionary[@"rating"] = currentUserCollection;
        [currentUserCollection release];
    }
    self.dictionary[@"rating"][@"value"] = [[NSNumber numberWithInt:myRating] stringValue];
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
    return [[self book] objectForKey:@"images"];
}


- (NSDictionary *)book {
    return [self.dictionary objectForKey:@"book"];
}

- (BookStatus)status {
    return [self convertStringToStatus:[self statusString]];
}

- (BookStatus)convertStringToStatus:(NSString *)statusString {
    if ([statusString isEqualToString:@"wish"]) {
        return WISH;
    } else if ([statusString isEqualToString:@"reading"]) {
        return READING;
    } else if ([statusString isEqualToString:@"read"]) {
        return READ;
    } else {
        return NOTADDED;
    }
}

- (void)setStatus:(NSString *)theStatus {
    self.dictionary[@"status"] = theStatus;
}

- (NSString *)statusTip {
    return [StatusUtil statusToTip:[self status]];
}

- (NSString *)statusString {
    return self.dictionary[@"status"];
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBook class]]) {
        return false;
    }

    return [self.id isEqualToString:[(DOUBook *) object id]];
}

@end
