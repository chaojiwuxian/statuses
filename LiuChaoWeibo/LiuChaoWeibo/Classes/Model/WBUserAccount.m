//
//  WBUserAccount.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBUserAccount.h"

@interface WBUserAccount ()<NSCoding>

@end

@implementation WBUserAccount


// 创建类方法及对象方法
+ (instancetype)userAccountWithDict:(NSDictionary *)dict
{
  return   [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

// 过滤没有的键值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

// 重写set方法  转换位过期日期
- (void)setExpires_in:(NSTimeInterval)expires_in
{
    _expires_in = expires_in;
    
    self.expiresDate = [[[NSDate  alloc]init] dateByAddingTimeInterval:expires_in];
}


// 保存用户信息
- (void)saveAccount
{

    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    path = [path stringByAppendingPathComponent:@"userAccount.achive"];
    
    [NSKeyedArchiver archiveRootObject:self toFile:path];

}


// 读取数据
- (WBUserAccount *)loadUserAccount
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    path = [path stringByAppendingPathComponent:@"userAccount.achive"];

    WBUserAccount *acc = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return acc;
}


#pragma  mark  归档与接档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expiresDate = [aDecoder decodeObjectForKey:@"expiresDate"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.avatar_large = [aDecoder decodeObjectForKey:@"avatar_large"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expiresDate forKey:@"expiresDate"];
     [aCoder encodeObject:self.uid forKey:@"uid"];
     [aCoder encodeObject:self.name forKey:@"name"];
     [aCoder encodeObject:self.avatar_large forKey:@"avatar_large"];
}


@end
