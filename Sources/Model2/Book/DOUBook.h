//
//  DOUBook.h
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUBook : DOUObject

@property (nonatomic, retain) UIImage *smallImage;

- (NSString *)title;

- (NSString *)author;


- (NSString *)authorIntro;


- (NSString *)publisher;

- (NSString *)smallImageUrl;


@end
