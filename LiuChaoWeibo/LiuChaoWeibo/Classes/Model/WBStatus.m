//
//  WBStatus.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//  微博模型

#import "WBStatus.h"

#import <YYModel.h>
@implementation WBStatus

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"statusID" : @"id"};
}

@end
