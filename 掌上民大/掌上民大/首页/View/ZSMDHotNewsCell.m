//
//  ZSMDHotNewsCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHotNewsCell.h"

@interface ZSMDHotNewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detial;
@property (weak, nonatomic) IBOutlet UILabel *lookCount;

@end

@implementation ZSMDHotNewsCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"newsCell";
    ZSMDHotNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
    
}

// 模型传入（设置数值）

@end
