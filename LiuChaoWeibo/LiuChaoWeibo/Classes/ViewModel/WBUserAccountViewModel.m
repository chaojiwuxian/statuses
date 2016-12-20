//
//  WBUserAccountViewModel.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBUserAccountViewModel.h"
#import <AFNetworking.h>

@interface WBUserAccountViewModel ()

// 令牌
@property (nonatomic, copy) NSString *accessToken;

// 账号模型
@property (nonatomic, strong) WBUserAccount *userAccount;

@end

@implementation WBUserAccountViewModel

static WBUserAccountViewModel* _instance = nil;

// 单例接口
+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[WBUserAccountViewModel alloc]init];
    });
    
    return _instance;
}



// 用户属性
- (WBUserAccount *)userAccount
{
    return [WBUserAccount loadUserAccount];
}


// 判断是否登录
- (BOOL)isLogin
{
    return self.accessToken != nil;
}


// 拿取令牌
- (NSString *)accessToken
{
    WBUserAccount *acc = self.userAccount;
    
    // 判断有没有
    if (!acc.access_token) {
        return nil;
    }
    
    if ([acc.expiresDate compare:[NSDate new]]  == NSOrderedDescending) {
        
        return acc.access_token;
    }else{
        return nil;
    }
}



// 根据 code 去请求token
- (void)requestAccountToken:(NSString *)code andCompletion:(void (^)(BOOL))completion
{

    
}


@end
