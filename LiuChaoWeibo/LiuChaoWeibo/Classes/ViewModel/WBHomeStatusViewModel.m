//
//  WBHomeStatusViewModel.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBHomeStatusViewModel.h"
#import "WBNetworkTools.h"
#import <YYModel.h>
#import "WBStatus.h"
@implementation WBHomeStatusViewModel

static WBHomeStatusViewModel *_homeStatusViewModel;
+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _homeStatusViewModel = [[WBHomeStatusViewModel alloc]init];
    });
    
    return _homeStatusViewModel;
}


// 加载数据
- (void)loadDataCompletion:(void (^)(BOOL))completion
{
    // 请求数据
    [[WBNetworkTools shared] requestHomeStatusCompletion:^(id resObj, NSError *error) {
    
        if (error) {
            completion(NO);
        }else{
        NSArray *statusesArr = [NSArray yy_modelArrayWithClass:[WBStatus class] json:resObj[@"statuses"]];
        
        self.statusesArr = statusesArr;
         
        completion(YES);
        }
    }];
}

@end
