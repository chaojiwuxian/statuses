//
//  WBNetworkTools.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBNetworkTools.h"
#import <AFNetworking.h>
#import "WBUserAccountViewModel.h"

#define client_id      @"2749473729"
#define client_secret  @"895a0f3e5034ff56832a6746f1d9c9c8"
#define redirect_uri   @"http://www.baidu.com"

typedef enum : NSUInteger {
    get,
    post
} RequestType;

@interface WBNetworkTools ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

static WBNetworkTools *_networkTool;
@implementation WBNetworkTools


+(instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkTool = [[WBNetworkTools alloc]init];
        _networkTool.manager = [AFHTTPSessionManager manager];
        [_networkTool.manager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Encoding"];
        _networkTool.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/plain",@"text/html", nil];
//        _networkTool.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    
    return _networkTool;
}

#pragma mark 请求微博数据
- (void)requestHomeStatusCompletion:(void (^)(id, NSError *))completion
{
    NSString *urlString = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    
    NSString *token = [WBUserAccountViewModel shared].userAccount.access_token;
    NSDictionary *dict = @{
                           @"access_token" : token
                           };
    
    [self request:get url:urlString params:dict completion:^(id resObj, NSError *error) {
       
        completion(resObj,error);
    }];
}


#pragma mark 请求用户信息

- (void)requestUserInfo:(NSString *)accesstoken uid:(int64_t)uid completion:(void (^)(id, NSError *))completion
{
    // 确定URL 包装参数
    NSString *urlString = @"https://api.weibo.com/2/users/show.json";
    
    NSDictionary *dict = @{
                           @"access_token" : accesstoken,
                           @"uid" : @(uid)
                           };
    
    [self request:get url:urlString params:dict completion:^(id responseObject, NSError *error) {
        
        completion(responseObject,error);
        
    }];
}


#pragma mark 请求accessToken
- (void)requestAccesstoken:(NSString *)code completion:(void (^)(id , NSError *))completion
{
    
    NSDictionary *dict = @{@"client_id": client_id,
                           @"client_secret": client_secret,
                           @"grant_type" : @"authorization_code",
                           @"code": code,
                           @"redirect_uri": redirect_uri};
    
    [self  request:post url:@"https://api.weibo.com/oauth2/access_token" params:dict completion:^(id responseObj, NSError *error) {
        
        completion(responseObj,error);
    }];

}


// 封装的get/ post请求方法
- (void)request:(RequestType)type url:(NSString *)urlString params:(NSDictionary *)params completion:(void (^)(id , NSError *))completion
{
    
    // 调用 AFN 的方法去请求数据
    if (type == post) {
        
        [self.manager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            completion(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            completion(nil,error);
        }];
    }else{
        
//   https://api.weibo.com/2/users/show.json?access_token=2.0027DbsFTiVEAD44d36ed53f56zKKE&uid=5387417605
//access_token=2.0027DbsFTiVEAD44d36ed53f56zKKE&uid=5387417605
        
        [self.manager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            completion(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"%@",error);
            completion(nil,error);
        }];
        
    }

}


@end
