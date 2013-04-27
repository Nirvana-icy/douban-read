//
//  DOUBook.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"

@implementation DOUBook {
}

- (NSString *)rating {
    return [self book][@"rating"][@"average"];
}

- (NSMutableArray *)ratingStars {
    return [self getStarsForRating:[self rating]];
}

- (NSMutableArray *)getStarsForRating:(NSString *)rating {
    NSMutableArray *result = [[@[@0, @0, @0, @0, @0] mutableCopy] autorelease];
    NSInteger ratingValue = [rating integerValue];
    for (NSUInteger i = 0; i < 5; i++) {
        if (0 <= ratingValue && ratingValue <= 1) {
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
    return self.dictionary[@"comment"];
}

- (NSMutableArray *)myRatingStar{
    return [self getStarsForRating:[self myRating]];
}

- (void)setComment:(NSString *)comment {
    self.dictionary[@"comment"] = comment;
}


- (NSString *)myRating {
    return self.dictionary[@"rating"][@"value"];
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
    NSString *status = self.dictionary[@"status"];
    if ([status isEqualToString:@"wish"]) {
        return WISH;
    } else if ([status isEqualToString:@"reading"]) {
        return READING;
    } else if ([status isEqualToString:@"read"]) {
        return READ;
    } else {
        return NOTADDED;
    }
}

- (void)setStatus:(NSString *)theStatus {
    self.dictionary[@"status"] = theStatus;
}

- (NSString *)statusTip {
    switch ([self status]) {
        case WISH:
            return @"我想读这本书";
        case READ:
            return @"我读过这本书";
        case READING:
            return @"我正在读这本书";
        default:
            return @"我尚未添加过这本书";
    }
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[DOUBook class]]) {
        return false;
    }

    return [self.id isEqualToString:[(DOUBook *) object id]];
}

@end
