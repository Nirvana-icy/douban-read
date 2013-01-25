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
    return [[self book] objectForKey:@"title"];
}

- (NSDictionary *)images {
    return [[self book] objectForKey:@"images"];
}

- (NSString *)smallImageUrl {
    if (![self images]) {
        return nil;
    } else {
        return [[self images] objectForKey:@"small"];
    }
}

- (NSDictionary *)book {
    return [self.dictionary objectForKey:@"book"];
}

@end
