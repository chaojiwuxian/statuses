//
//  WBToolBar.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBToolBar.h"

#import "CZAdditions.h"

#import <Masonry.h>

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
    UIButton *reweetButton = [UIButton cz_textButton:@"转发" fontSize:14 normalColor:[UIColor grayColor] normalImageName:@"timeline_icon_retweet" backgroundImageName:@"timeline_card_bottom_background"];
    [self addSubview:reweetButton];
    
    // 评论
    UIButton *commentButton = [UIButton cz_textButton:@"评论" fontSize:14 normalColor:[UIColor grayColor] normalImageName:@"timeline_icon_comment" backgroundImageName:@"timeline_card_bottom_background"];
    [self addSubview:commentButton];
    
    // 赞
    UIButton *unlikeButton = [UIButton cz_textButton:@"赞" fontSize:14 normalColor:[UIColor grayColor] normalImageName:@"timeline_icon_unlike" backgroundImageName:@"timeline_card_bottom_background"];
    [self addSubview:unlikeButton];
    
    // 分割线1
    UIImageView *firsrLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:firsrLine];
    // 分割线2
    UIImageView *secondLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:secondLine];
    
    // 添加约束
    [reweetButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.equalTo(self);
    }];
    
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.equalTo(self);
        make.left.equalTo(reweetButton.mas_right);
        make.width.equalTo(reweetButton);
    }];
    
    [unlikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(commentButton.mas_right);
        make.width.equalTo(commentButton);
        
    }];
    
    [firsrLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(reweetButton.mas_right);
        make.centerY.equalTo(self);
    }];
    
    [secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(commentButton.mas_right);
        make.centerY.equalTo(self);
    }];
}

@end
