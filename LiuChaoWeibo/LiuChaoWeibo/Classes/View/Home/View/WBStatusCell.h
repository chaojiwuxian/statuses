//
//  WBStatusCell.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBStatus;

@interface WBStatusCell : UITableViewCell

// 一条微博数据
@property (nonatomic, strong) WBStatus *status;

@end
