//
//  ZSMDIMovieCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDIMovieCell.h"

@implementation ZSMDIMovieCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"moiveCell";
    ZSMDIMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
    
}


@end
