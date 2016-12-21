//
//  WBHomeStatusViewModel.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHomeStatusViewModel : NSObject

// 单例接口
+ (instancetype)shared;


// 加载数据完成回调
- (void)loadDataCompletion:(void (^)(BOOL isSuccess))completion;



@end
