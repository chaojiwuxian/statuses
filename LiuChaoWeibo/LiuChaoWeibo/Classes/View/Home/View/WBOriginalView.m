//
//  WBOriginalView.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBOriginalView.h"

#import "WBStatus.h"

#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface WBOriginalView ()

// 头像
@property (nonatomic, weak) UIImageView *userImageView;

// 昵称
@property (nonatomic, weak) UILabel *screenNameLabel;

// 来源
@property (nonatomic, weak) UILabel *sourceLabel;

// 内容
@property (nonatomic, weak) UILabel *textLabel;

@end

@implementation WBOriginalView

- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}


#pragma mark 重写set方法啊  设置数据
- (void)setStatus:(WBStatus *)status
{
    _status = status;
 
    // 头像
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:status.user.avatar_hd] placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
    
    // 昵称
    self.screenNameLabel.text = status.user.screen_name;
    
    // 来自
//    self.sourceLabel.text = status.source;
    
    // 内容
    self.textLabel.text = status.text;
}

#pragma makr  添加子控件

- (void)setUpUI
{
    CGFloat margin = 10;
    
     // 创建 添加
    // 头像
    UIImageView *userImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default_big"]];
    [self addSubview:userImageView];
    
    // 认证类型
    UIImageView *verifiedTypeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_enterprise_vip"]];
    [self addSubview:verifiedTypeImageView];

    // 会员等级
    UIImageView *mbrankImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_membership"]];
    [self addSubview:mbrankImageView];
    
    // 昵称
    UILabel *screenNameLabel = [[UILabel alloc]init];
    screenNameLabel.font = [UIFont systemFontOfSize:14];
    screenNameLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:screenNameLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor orangeColor];
    [self addSubview:timeLabel];
    
    // 来源
    UILabel *sourceLabel = [[UILabel alloc]init];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:sourceLabel];
    
    // 内容
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = [UIColor blackColor];
    textLabel.numberOfLines = 0;
    [self addSubview:textLabel];
    
    // 属性赋值
    self.userImageView = userImageView;
    self.sourceLabel = sourceLabel;
    self.screenNameLabel = screenNameLabel;
    self.textLabel = textLabel;
    
    // 约束
   [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
       make.top.left.equalTo(self).offset(10);
       make.size.mas_equalTo(CGSizeMake(35, 35));
   }];
    
    [verifiedTypeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(userImageView.mas_right);
        make.centerY.equalTo(userImageView.mas_bottom);
    }];

    [screenNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(userImageView.mas_right).offset(margin);
        make.top.equalTo(userImageView);
    }];
    
    [mbrankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(screenNameLabel.mas_right).offset(margin);
        make.top.equalTo(screenNameLabel);
    }];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(screenNameLabel);
        make.bottom.equalTo(userImageView);
        
    }];
    
    [sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(timeLabel.mas_right).offset(margin);
        make.bottom.equalTo(timeLabel);
    }];
    
    // 内容
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(userImageView.mas_bottom).offset(margin);
        make.left.equalTo(self).offset(margin);
        make.right.equalTo(self).offset(-margin);
        make.bottom.equalTo(self).offset(-margin);
    }];
}


@end
