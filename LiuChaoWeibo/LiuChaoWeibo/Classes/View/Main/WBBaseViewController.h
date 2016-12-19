//
//  WBBaseViewController.h
//  LiuChaoWeibo
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBaseViewController : UIViewController

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) UITableView *tableView;
- (void)loadData;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
