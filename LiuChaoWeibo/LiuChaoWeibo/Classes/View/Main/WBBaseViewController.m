//
//  WBBaseViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBBaseViewController.h"

@interface WBBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    
    [self setUpTableView];
}


// 添加tableView
-(void)setUpTableView
{
    _tableView = [[UITableView alloc]init];
    
    _tableView.frame = self.view.bounds;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
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
