//
//  DOUBook.h
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

typedef enum {
    READ,
    WISH,
    READING,
    NOTADDED
} BookStatus;


@interface DOUBook : DOUObject

@property (nonatomic, retain) UIImage *smallImage;
@property (nonatomic, retain) UIImage *mediumImage;

- (NSString *)rating;

- (NSString *)numberOfRaters;

- (NSString *)title;

- (NSString *)author;


- (NSString *)id;

- (NSString *)authorIntro;


- (NSString *)publisher;

- (NSString *)pages;

- (NSString *)price;

- (NSString *)publishDate;

- (NSString *)myComment;

- (NSString *)myRating;

- (NSString *)smallImageUrl;

- (NSString *)mediumImageUrl;

- (BookStatus)status;


@end
