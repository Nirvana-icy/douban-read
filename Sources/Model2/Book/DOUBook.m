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

@dynamic identifier;
@dynamic title;
@dynamic subTitle;
@dynamic rating;
@dynamic numRaters;
@dynamic average;
@dynamic ISBN10;
@dynamic ISBN13;

@dynamic publisher;
@dynamic publishDateStr;
@dynamic publishDate;

@dynamic image;
@dynamic largeImage;
@dynamic smallImageUrl;
@dynamic mediumImage;

@dynamic authorIntro;
@dynamic summary;


- (NSString *)identifier {
    return [[self book] objectForKey:@"book_id"];
}

- (NSString *)subTitle {
    return [self.dictionary objectForKey:@"subtitle"];
}

- (NSString *)title {
    return [[self book] objectForKey:@"title"];
}

- (NSString *)rating {
    return [[self book] objectForKey:@"rating"];
}

- (NSString *)numRaters {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"numRaters"];
    }
}

- (NSString *)average {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"average"];
    }
}

- (NSString *)ISBN10 {
    return [self.dictionary objectForKey:@"isbn10"];
}

- (NSString *)ISBN13 {
    return [self.dictionary objectForKey:@"isbn13"];
}

- (NSString *)publishDateStr {
    return [self.dictionary objectForKey:@"pubdate"];
}

- (NSDate *)publishDate {
    return [[self class] dateOfString:[self publishDateStr] dateFormat:@"yyyy-MM"];
}


- (NSString *)image {
    return [[self book] objectForKey:@"image"];
}

- (NSDictionary *)images {
    return [[self book] objectForKey:@"images"];
}

- (NSString *)largeImage {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"large"];
    }
}

- (NSString *)smallImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"small"];
    }
}


- (NSString *)mediumImage {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"medium"];
    }
}


- (NSString *)authorIntro {
    return [[self book] objectForKey:@"author_intro"];
}

- (NSArray *)authors{
    return [[self book] objectForKey:@"author"];
}

- (NSString *)summary {
    return [[self book] objectForKey:@"summary"];
}

- (NSDictionary *)book {
    return [self.dictionary objectForKey:@"book"];
}

@end
