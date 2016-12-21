//
//  WBBaseViewController.h
//  LiuChaoWeibo
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBVisitorView.h"
@interface WBBaseViewController : UITableViewController


// 记录访客视图
@property (nonatomic, weak)WBVisitorView *visitorView;

// 是否登录
@property (nonatomic, assign) BOOL isLogin;

@end
