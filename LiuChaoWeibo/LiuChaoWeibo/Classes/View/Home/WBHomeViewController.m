//
//  WBHomeViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBVisitorView.h"

#import "WBHomeStatusViewModel.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
    
    // 判断是否登录
    if (!self.isLogin) {
        [self.visitorView  setUpViewContent:@"关注一些人,在这里看看有什么惊喜\n关注一些人,在这里看看有什么惊喜" andCircleImageName:@"visitordiscover_feed_image_smallicon" andHomeImageName:@"visitordiscover_feed_image_house"];
    }else{
        
        [self setUpUI];
        [self loadData];
    }
}


#pragma mark 加载数据
- (void)loadData
{
     [[WBHomeStatusViewModel shared] loadDataCompletion:^(BOOL isSuccess) {
        
         if (isSuccess) {
             
             [self.tableView reloadData];
         }
         
     }];
}


#pragma mark 设置界面
- (void)setUpUI
{
    // tableView 相关
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeCellID"];
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}


#pragma mark TableViewDelegate AND TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"HomeCellID"];
    
    cell.textLabel.text = @"fadfa";
    
    
    return cell;
}

@end
