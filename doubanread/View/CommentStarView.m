//
//  CommentStarView.m
//  doubanread
//
//  Created by jli on 4/28/13.
//  Copyright (c) 2013 jli. All rights reserved.
//

#import "CommentStarView.h"

@implementation CommentStarView{
    NSMutableArray *starButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createStarButtons];
    }
    return self;
}

- (void)createStarButtons{
    UIButton *button1 = [[UIButton alloc]init];
}

@end
