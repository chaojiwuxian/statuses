//
//  WBNavigationController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBNavigationController.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController


/**
 @param viewController 即将跳转的控制器
 @param animated 动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 判断当前 子控制器的个数
    if (self.childViewControllers.count > 0) {
        // 隐藏底部的 tabbar
        self.tabBarController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}


@end
