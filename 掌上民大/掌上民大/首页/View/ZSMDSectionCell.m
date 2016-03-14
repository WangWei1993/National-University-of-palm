//
//  ZSMDSectionCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDSectionCell.h"
#import "ZSMDSection.h"

@interface ZSMDSectionCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@end

@implementation ZSMDSectionCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"sectionCell";
    ZSMDSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
//    // 设置cell的饿背景颜色
//    cell.contentView.backgroundColor = [UIColor whiteColor];
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
    
}

- (void)setSection:(ZSMDSection *)section
{
    _section = section;
    self.titleLabel.text = section.title;
    
//    NSLog(@"%@",section.title);

}

@end
