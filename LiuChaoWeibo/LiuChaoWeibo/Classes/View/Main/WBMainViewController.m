//
//  WBMainViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBMainViewController.h"

#import "WBNavigationController.h"

@interface WBMainViewController ()

@property (nonatomic, strong) UIButton  *composeButton;

@end

@implementation WBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置全局数据
    self.tabBar.tintColor = [UIColor orangeColor];
    
    // 通过全局设置  字体及图片
//    [UITabBarItem appearance] setTitleTextAttributes:<#(nullable NSDictionary<NSString *,id> *)#> forState:<#(UIControlState)#>
  
    // 添加子控制器
    [self addChildViewControllers];
    
    
    // 添加中间加号按钮  设置位置
    NSUInteger count = self.childViewControllers.count;
    CGFloat w = self.tabBar.bounds.size.width / count - 1;
    self.composeButton.frame = CGRectInset(self.tabBar.bounds, w * 2 , 0);
}

#pragma mark 特殊处理
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 调整加号按钮的位置
    [self.tabBar bringSubviewToFront:self.composeButton];
}

#pragma mark 加号按钮的点击事件
- (void)composeButtonClick
{
    NSLog(@"composeButtonClick");
}


#pragma mark 添加子控制器
- (void)addChildViewControllers
{
    NSArray *vcs = @[@{@"vcName":@"WBHomeViewController",@"title":@"首页",@"imageName":@"tabbar_home"},
                     @{@"vcName":@"WBMessageViewController",@"title":@"消息",@"imageName":@"tabbar_message_center"},
                     @{@"vcName":@"UIViewController",@"title":@"",@"imageName":@""},
                     @{@"vcName":@"WBDiscoverViewController",@"title":@"发现",@"imageName":@"tabbar_discover"},
                     @{@"vcName":@"WBProfileViewController",@"title":@"我",@"imageName":@"tabbar_profile"}
                     ];
    
    for (int i = 0; i < vcs.count; i++) {
        [self addChildViewControllerWithDict:vcs[i]];
    }
}

// 添加一个控制器
- (void)addChildViewControllerWithDict:(NSDictionary *)dict
{
    Class c = NSClassFromString(dict[@"vcName"]);
    
    UIViewController *vc = [[c alloc]init];
    // 添加断言 判断传过来的是否为控制类型
    NSAssert([vc isKindOfClass:[UIViewController class]], @"不是一个控制器的类");
    
    // 设置数据
    vc.title = dict[@"title"];
    NSString *name = dict[@"imageName"];
    vc.tabBarItem.image = [UIImage imageNamed:name];
    name = [name stringByAppendingString:@"_selected"];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:name];
    
    WBNavigationController *nav = [[WBNavigationController alloc]initWithRootViewController:vc];
    
    // 添加
    [self addChildViewController:nav];
}

#pragma mark 添加在撰写按钮

- (UIButton *)composeButton
{
    if (_composeButton == nil) {
     
        _composeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_composeButton addTarget:self action:@selector(composeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:_composeButton];
    }
    return _composeButton;
}

@end
