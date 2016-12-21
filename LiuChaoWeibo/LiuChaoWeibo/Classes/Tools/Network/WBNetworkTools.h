//
//  WBNetworkTools.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WBNetworkTools : NSObject


// 单例接口
+(instancetype)shared;

// 请求微博数据
- (void)requestHomeStatusCompletion:(void (^)(id resObj,NSError *error))completion;

// 再次请求用户信息
- (void)requestUserInfo:(NSString *)accesstoken uid:(int64_t)uid  completion:(void (^)(id resObj,NSError *error))completion;

// 请求 accessToken
- (void)requestAccesstoken:(NSString *)code  completion:(void (^)(id resObj,NSError *error))completion;


@end
