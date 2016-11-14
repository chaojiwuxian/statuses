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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


#pragma mark 设置界面
- (void)setUpUI
{
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
