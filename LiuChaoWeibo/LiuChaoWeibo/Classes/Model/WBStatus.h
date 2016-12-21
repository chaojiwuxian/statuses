//
//  WBStatus.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUser.h"
@interface WBStatus : NSObject

// 创建微博时间
@property (nonatomic, copy) NSString *created_at;

// 微博来源
@property (nonatomic, copy) NSString *source;

// 微博id
@property (nonatomic, assign) int64_t statusID;

// 微博内容
@property (nonatomic, copy) NSString *text;


// 微博作者
@property (nonatomic, strong) WBUser *user;

// 转发微博
@property (nonatomic, strong) WBStatus *retweeted_status;

// 转发数
@property (nonatomic, assign) int reposts_count;

// 评论数
@property (nonatomic, assign) int comments_count;

// 表态数
@property (nonatomic, assign) int attitudes_count;

@end
