//
//  WBUserAccountViewModel.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBUserAccountViewModel.h"
#import <AFNetworking.h>
#import "WBNetworkTools.h"

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

    [[WBNetworkTools shared] requestAccesstoken:code completion:^(id resObj, NSError *error) {
        
        // 判断请求是否有问题
        if (error) { // 有问题
            completion(NO);
            
            return ;
        }
        
        // 进行字典转模型  解析数据  创建用户账户
    
        WBUserAccount *acc = [WBUserAccount userAccountWithDict:resObj];
        
        //在次请求 用户信息
        
        [self requestUserInfo:acc andCompletion:completion];
    }];
}


// 根据获取到的 token 再次请求用户信息
- (void)requestUserInfo:(WBUserAccount *)acc andCompletion:(void (^)(BOOL))completion
{

    [[WBNetworkTools shared] requestUserInfo:acc.access_token uid:acc.uid completion:^(id resObj, NSError *error) {
       
        if (error) {
            NSLog(@"%@",error);
            
            completion(NO);
        }else{
            
            // 请求成功
            [acc setValuesForKeysWithDictionary:resObj];
            
            // 进行存储
            [acc saveAccount];
            
            completion(YES);
        }
    }];
    
}

@end
