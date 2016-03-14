//
//  ZSMDBannerCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDBannerCell.h"
#import "Masonry.h"

@implementation ZSMDBannerCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"bannerCell";
    ZSMDBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}



@end
