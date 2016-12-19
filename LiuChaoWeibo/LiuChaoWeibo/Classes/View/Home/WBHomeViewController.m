//
//  WBHomeViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBHomeViewController.h"

#import <AFNetworking.h>
@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];

}




#pragma mark 设置界面
- (void)setUpUI
{
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
