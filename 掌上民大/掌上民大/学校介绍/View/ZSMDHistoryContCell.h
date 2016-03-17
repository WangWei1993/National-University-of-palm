//
//  ZSMDHistoryContCell.h
//  掌上民大
//
//  Created by 王伟 on 16/3/15.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSMDHistory;

@interface ZSMDHistoryContCell : UITableViewCell

/** 模型数据 */
@property (nonatomic, strong) ZSMDHistory *history;


// 定义cell的类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
