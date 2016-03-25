//
//  ZSMDBannerCell.h
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYBannerView.h"

@class ZSMDBannerCell;

@protocol ZSMDBannerCellDelegate <NSObject>

@optional

@end

@interface ZSMDBannerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ZYBannerView *banner;


// 定义cell的类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
