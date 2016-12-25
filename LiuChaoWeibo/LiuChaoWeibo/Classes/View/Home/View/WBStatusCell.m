//
//  WBStatusCell.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBStatusCell.h"
#import <Masonry.h>

#import "WBStatus.h"

#import "WBOriginalView.h"

@interface WBStatusCell ()

// 原创视图
@property (nonatomic, weak) WBOriginalView *originalView;

@end

@implementation WBStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加子控件
        [self setUpUI];
    }
    
    return self;
}



- (void)setStatus:(WBStatus *)status
{
    _status = status;
    
    self.originalView.status = status;

}


#pragma mark  添加子控件
- (void)setUpUI
{
    // 创建 及 添加
    WBOriginalView *originalView = [[WBOriginalView alloc]init];
    [self.contentView addSubview:originalView];
    
    
    // 属性赋值
    self.originalView = originalView;
    
    
    // 设置约束
    [originalView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.bottom.equalTo(self.contentView);
    }];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
