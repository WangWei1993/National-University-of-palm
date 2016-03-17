//
//  ZSMDClassifyCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassifyCell.h"

@interface ZSMDClassifyCell()

@end

@implementation ZSMDClassifyCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"classifyCell";
    ZSMDClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
//    }
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    cell.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT * 0.3);
    
    
    return cell;
    
}



@end
