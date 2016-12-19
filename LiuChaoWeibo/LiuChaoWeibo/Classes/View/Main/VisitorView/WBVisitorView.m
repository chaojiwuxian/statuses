//
//  WBVisitorView.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBVisitorView.h"
#import <Masonry.h>

@interface WBVisitorView ()

// 转盘   需要修改图片
@property (nonatomic, weak) UIImageView *circleImageView;

// 房子
@property (nonatomic, weak) UIImageView *homeImageView;

// 标题
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation WBVisitorView

#pragma mark 重写init方法
- (instancetype)initWithFrame:(CGRect)frame
{
 
    if (self =[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed: 231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0];
        
        [self setUpUI];
    }
    
    return self;
}

#pragma mark  重新设置数据
- (void)setUpViewContent:(NSString *)title andCircleImageName:(NSString *)name andHomeImageName:(NSString *)homeName
{
    self.titleLabel.text = title;
    self.circleImageView.image = [UIImage imageNamed:name];
    
    if (homeName == nil) {
        // 说明不是首页
     // 隐藏房子视图
        self.homeImageView.hidden = YES;
    }else{
     
        // 是首页
        // 添加动画
        [self addAnimation];
    }
}


// 添加动画
- (void)addAnimation
{
    CABasicAnimation  *animation = [[CABasicAnimation alloc]init];
    animation.keyPath = @"transform.rotation";
    animation.toValue = @(M_PI * 2);
    animation.duration = 15;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [self.circleImageView.layer addAnimation:animation forKey:nil];

}

#pragma mark 设置界面
- (void)setUpUI
{
    // 房子  中间控件
    UIImageView *homeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_house"]];
    [self addSubview:homeImageView];
    
    // 转盘
    UIImageView *circleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_smallicon"]];
    [self addSubview:circleImageView];
    
    // 遮盖
    UIImageView *coverImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"]];
    [self addSubview:coverImageView];

    // 标题
    UILabel *titleLabel = [[UILabel alloc]init];
    [self addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    titleLabel.text = @"关注一些人,回这里看看有什么惊喜\n关注一些人,回这里看看有什么惊喜";
    titleLabel.textColor = [UIColor blackColor];
    
    // 注册按钮
    UIButton *registerButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:registerButton];
    
    // 登录按钮
    UIButton *loginButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:loginButton];
    
    
    // 记录属性
    
    self.circleImageView = circleImageView;
    self.homeImageView = homeImageView;
    self.titleLabel = titleLabel;

    // 设置约束
    [circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.mas_equalTo(175);
        make.centerX.equalTo(self);
        make.centerY.equalTo(circleImageView).offset(10);
        
    }];
    
    [homeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(circleImageView);
        make.centerY.equalTo(circleImageView);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(220);
        make.centerX.equalTo(circleImageView);
        make.top.equalTo(circleImageView.mas_bottom).offset(15);
    }];
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(35);
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.left.equalTo(titleLabel);
        
    }];
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(35);
        make.top.equalTo(registerButton);
        make.right.equalTo(titleLabel);
    }];
    
}

@end
