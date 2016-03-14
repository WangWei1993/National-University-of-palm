//
//  ZSMDHomeFooter.m
//  掌上民大
//
//  Created by 王伟 on 16/3/14.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHomeFooter.h"

@implementation ZSMDHomeFooter

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"footerCell";
    ZSMDHomeFooter *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    
    // 取消cell的选中状态
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    // cell的背景颜色
    cell.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
    
    return cell;
    
}

@end
