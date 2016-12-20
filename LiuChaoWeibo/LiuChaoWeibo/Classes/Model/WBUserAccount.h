//
//  WBUserAccount.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 用户账户信息
@interface WBUserAccount : NSObject

/// 访问令牌
@property (nonatomic, copy) NSString *access_token;

/// 用户代号
@property (nonatomic, copy) NSString *uid;

/// access_token的生命周期，单位是秒数
@property (nonatomic, assign) NSTimeInterval expires_in;

/// 过期日期
@property (nonatomic, strong) NSDate *expiresDate;


//=====================================//

/// 用户名
@property (nonatomic, copy) NSString *name;

/// 用户头像
@property (nonatomic, copy) NSString *avatar_large;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)userAccountWithDict:(NSDictionary *)dict;

@end
