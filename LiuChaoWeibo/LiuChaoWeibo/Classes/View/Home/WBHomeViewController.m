//
//  WBHomeViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBVisitorView.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.visitorView  setUpViewContent:@"关注一些人,在这里看看有什么惊喜\n关注一些人,在这里看看有什么惊喜" andCircleImageName:@"visitordiscover_feed_image_smallicon" andHomeImageName:@"visitordiscover_feed_image_house"];

}




#pragma mark 设置界面


@end
