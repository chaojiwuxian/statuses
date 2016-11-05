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


@end
