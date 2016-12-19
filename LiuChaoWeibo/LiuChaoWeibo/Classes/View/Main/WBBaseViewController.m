//
//  WBBaseViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBBaseViewController.h"
#import "WBVisitorView.h"
@interface WBBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) BOOL isLogin;

// 记录访客视图
@property (nonatomic, weak)WBVisitorView *v;

@end

@implementation WBBaseViewController

- (instancetype)init
{
    if (self = [super init]) {
        // 设置登录状态
        self.isLogin = NO;
    }
    return self;
}

#pragma mark 重写方法 设置控制器的跟视图
- (void)loadView
{
    if (self.isLogin) {
        
        [super loadView];
    }else{
        
        WBVisitorView *v = [[WBVisitorView alloc]init];
   
        self.view = v;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark 数据源方法及代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}


@end
