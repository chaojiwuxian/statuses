//
//  WBVisitorView.h
//  LiuChaoWeibo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBVisitorView;
@protocol WBVisitorViewDelegate<NSObject>

- (void)visitorView:(WBVisitorView *)view;

@end

@interface WBVisitorView : UIView


// 代理属性
@property (nonatomic, weak) id <WBVisitorViewDelegate> delegate;


// 设置内容
- (void)setUpViewContent:(NSString *)title andCircleImageName:(NSString *)name andHomeImageName:(NSString *)homeName;

@end
