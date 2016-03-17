//
//  ZSMDHistoryContCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/15.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHistoryContCell.h"
#import "ZSMDHistory.h"

@interface ZSMDHistoryContCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *timeView;

// 图片数组
@property (nonatomic, strong) NSArray *arrImage;
@end

@implementation ZSMDHistoryContCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"historyCell";
    ZSMDHistoryContCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    
    // 取消cell的点击状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}

- (void)awakeFromNib
{
    //
    self.timeView.backgroundColor = [UIColor colorWithRed:240.0/255 green:233.0/255.0 blue:226.0/255.0 alpha:1];
    
    // label的高度更加准确
    self.contentLabel.preferredMaxLayoutWidth = SCREENWIDTH - 10;
    
   
    
}

- (void)setHistory:(ZSMDHistory *)history
{
    _history = history;
    self.timeLabel.text = history.time;
    self.contentLabel.text = history.contentText;
    self.arrImage = history.arrImage;
    
    [self setupScrollView];
    
    [self layoutIfNeeded];
    
    
    
    
    if (_arrImage) {
        history.heightCell = CGRectGetMaxY(self.scrollView.frame) + 18;
    } else {
        history.heightCell = CGRectGetMaxY( self.contentLabel.frame) + 10;
    }
    
    

}
- (void)setupScrollView
{
    for (int i = 0; i < self.arrImage.count; i++) {
        NSString *name = self.arrImage[i];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        
        [self.scrollView addSubview:icon];
        
    }
    
    // 设置图片尺寸
    CGFloat imageH = self.frame.size.height * 0.45;
    CGFloat imageW = 1.5 * imageH;
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake((10 * i)+ imageW * i + 5 , 0, imageW, imageH);
        
    }
    // 设置ScrollView尺寸
    self.scrollView.contentSize = CGSizeMake(imageW * self.scrollView.subviews.count, 0);
}


@end
