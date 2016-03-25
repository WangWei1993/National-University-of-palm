//
//  ZSMDListenCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDListenCell.h"

@interface ZSMDListenCell()
/**
 *  随声听scrollView
 */

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


/** 1 */
@property (nonatomic, weak) UIImageView *imageView1;

/** 2 */
@property (nonatomic, weak) UIImageView *imageView2;

/** 3 */
@property (nonatomic, weak) UIImageView *imageView3;

/** 4 */
@property (nonatomic, weak) UIImageView *imageView4;

/** 5 */
@property (nonatomic, weak) UIImageView *imageView5;

@end

@implementation ZSMDListenCell



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"listenCell";
    ZSMDListenCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
    
}


- (void)awakeFromNib
{
    for (int i = 0; i < 5; i++) {
        NSString *name = [NSString stringWithFormat:@"img_0%d",i];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        
        [self.scrollView addSubview:icon];
        
        // 返回scrollView 中子控件的个数
//        NSLog(@"%zd",self.scrollView.subviews.count);
        
    }
}

- (void)layoutSubviews
{
    // 设置图片尺寸
    CGFloat imageW = self.frame.size.width * 0.6;
    CGFloat imageH = self.frame.size.height;
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(imageW * i + 5 + i * 10, 0, imageW, imageH);
        
    }
    
    // 设置ScrollView尺寸
    self.scrollView.contentSize = CGSizeMake(imageW * self.scrollView.subviews.count + self.scrollView.subviews.count * 10, imageH);
}

- (void)setListen:(ZSMDListen *)listen
{
    _listen = listen;
//    self.
}

@end
