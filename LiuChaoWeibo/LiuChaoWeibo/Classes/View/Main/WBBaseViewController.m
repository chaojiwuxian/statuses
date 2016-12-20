//
//  WBBaseViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBBaseViewController.h"
#import "WBOAuthViewController.h"

@interface WBBaseViewController ()<WBVisitorViewDelegate>

@property (nonatomic, assign) BOOL isLogin;

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
        
        WBVisitorView *visitorView = [[WBVisitorView alloc]init];
        visitorView.delegate = self;
        self.visitorView = visitorView;
        self.view = visitorView;
        
        // 设置导航条的内容
        [self setUpNav];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 注册与登录的点击事件
- (void)btnClick
{
    // 弹出登录 / 授权界面
    
    WBOAuthViewController *vc = [[WBOAuthViewController alloc]init];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    
}

#pragma mark WBVisitorViewDelegate
- (void)visitorView:(WBVisitorView *)view
{
    [self btnClick];
}


#pragma mark 设置导航条
- (void)setUpNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];

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
