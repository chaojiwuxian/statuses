//
//  WBToolBar.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBToolBar.h"

@implementation WBToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark 设置内容
- (void)setUpUI
{
    // 转发
    UIButton *reweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:reweetButton];
    [reweetButton setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
    [reweetButton setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
    [reweetButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [reweetButton setTitle:@"转发" forState:UIControlStateNormal];
    reweetButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    // 评论
    
    // 赞
    
}

@end
