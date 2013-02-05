//
//  DOUBook.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"
#import "DOUObject+Utils.h"
#import "SBJson.h"

@implementation DOUBook {
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

- (NSString *)smallImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"small"];
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
    } else {
        return READ;
    }
}
@end
