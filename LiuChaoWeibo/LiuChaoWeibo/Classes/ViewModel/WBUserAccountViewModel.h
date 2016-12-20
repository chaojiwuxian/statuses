//
//  WBUserAccountViewModel.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WBUserAccount.h"
@interface WBUserAccountViewModel : NSObject

// 单例接口
+ (instancetype)shared;

// 是否登录
- (BOOL)isLogin;

- (void)requestAccountToken:(NSString *)code andCompletion:(void (^)(BOOL isSuccess))completion;

@end

