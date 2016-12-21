//
//  WBWelcomeViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBWelcomeViewController.h"
#import <UIImageView+WebCache.h>
#import "WBUserAccountViewModel.h"
#import "WBUserAccount.h"

#import <Masonry.h>
@interface WBWelcomeViewController ()

@property (nonatomic, weak) UIImageView *userIconView;

@property (nonatomic, weak) UILabel *msgLabel;

@end

@implementation WBWelcomeViewController

- (void)loadView
{
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ad_background"]];
    
    self.view = bgImageView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
    [self startAnimation];
}


#pragma mark  开始动画
- (void)startAnimation
{
    // 更新约束
    
    [self.userIconView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(100);
        
    }];
    
    // usingSpringWithDamping 弹动的幅度 取值范围 0 - 1
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:1.0 animations:^{
            self.msgLabel.alpha = 1;
        } completion:^(BOOL finished) {
            // 发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchRootVC" object:nil];
        }];

        
    }];
}


#pragma  mark  设置界面
- (void)setUpUI
{
    
    // 头像视图
    UIImageView *userIconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default_big"]];
    [self.view addSubview:userIconView];
    
    NSURL *url = [NSURL URLWithString:WBUserAccountViewModel.shared.userAccount.avatar_large];
    [userIconView sd_setImageWithURL:url];
    
    userIconView.layer.cornerRadius = 45;
    userIconView.layer.masksToBounds = YES;
    
    
    // 文字控件
    UILabel *msgLabel = [[UILabel alloc]init];
    [self.view addSubview:msgLabel];
    msgLabel.textColor = [UIColor darkGrayColor];
    msgLabel.alpha = 0;
    NSString *name = WBUserAccountViewModel.shared.userAccount.name;
    if (name) {
        msgLabel.text = [NSString stringWithFormat:@"欢迎回来%@",name];
        
    }else{
    
        msgLabel.text = @"欢迎回来";
    }
    
    
    // 记录属性
    self.userIconView = userIconView;
    self.msgLabel = msgLabel;
    // 设置约束
    [userIconView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(200);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(userIconView.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
}

@end
