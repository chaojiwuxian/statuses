//
//  WBUser.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject

// 用户昵称
@property (nonatomic, copy) NSString *screen_name;

// 用户头像地址
@property (nonatomic, copy) NSString *profile_image_url;

// 高清图片
@property (nonatomic, copy) NSString *avatar_hd;

@end
