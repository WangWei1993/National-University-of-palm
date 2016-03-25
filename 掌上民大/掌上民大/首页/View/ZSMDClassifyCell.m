//
//  ZSMDClassifyCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassifyCell.h"
#import "WWButton.h"
#import "SDImageCache.h"
#import "ZSMDClassify.h"
#import "WWButtonModel.h"

@interface ZSMDClassifyCell()
@property (weak, nonatomic) IBOutlet WWButton *introduceBtn;
@property (weak, nonatomic) IBOutlet WWButton *chuangxinBtn;
@property (weak, nonatomic) IBOutlet WWButton *zixunBtn;
@property (weak, nonatomic) IBOutlet WWButton *mapBtn;
@property (weak, nonatomic) IBOutlet WWButton *listenBtn;
@property (weak, nonatomic) IBOutlet WWButton *lookBtn;
@property (weak, nonatomic) IBOutlet WWButton *laughBtn;
@property (weak, nonatomic) IBOutlet WWButton *jinliaoBtn;

@end

@implementation ZSMDClassifyCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"classifyCell";
    ZSMDClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (void)setClassify:(ZSMDClassify *)classify
{
    _classify = classify;
    UIImageView *imageV = [[UIImageView alloc] init];
    NSURL *url = [NSURL URLWithString:classify.icon];
    [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"school"]];
    [self.introduceBtn setImage:imageV.image forState:UIControlStateNormal];
    
    UIImageView *imageV1 = [[UIImageView alloc] init];
    NSURL *url1 = [NSURL URLWithString:classify.icon1];
    [imageV1 sd_setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"chuangxin"]];
    [self.chuangxinBtn setImage:imageV1.image forState:UIControlStateNormal];
    
    UIImageView *imageV2 = [[UIImageView alloc] init];
    NSURL *url2 = [NSURL URLWithString:classify.icon2];
    [imageV2 sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"news"]];
    [self.zixunBtn setImage:imageV2.image forState:UIControlStateNormal];
    
    UIImageView *imageV3 = [[UIImageView alloc] init];
    NSURL *url3 = [NSURL URLWithString:classify.icon3];
    [imageV3 sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"map"]];
    [self.mapBtn setImage:imageV3.image forState:UIControlStateNormal];
    
    UIImageView *imageV4 = [[UIImageView alloc] init];
    NSURL *url4 = [NSURL URLWithString:classify.icon4];
    [imageV4 sd_setImageWithURL:url4 placeholderImage:[UIImage imageNamed:@"listen"]];
    [self.listenBtn setImage:imageV4.image forState:UIControlStateNormal];
    
    UIImageView *imageV5 = [[UIImageView alloc] init];
    NSURL *url5 = [NSURL URLWithString:classify.icon5];
    [imageV5 sd_setImageWithURL:url5 placeholderImage:[UIImage imageNamed:@"ikankan"]];
    [self.lookBtn setImage:imageV5.image forState:UIControlStateNormal];
    
    
    UIImageView *imageV6 = [[UIImageView alloc] init];
    NSURL *url6 = [NSURL URLWithString:classify.icon6];
    [imageV6 sd_setImageWithURL:url6 placeholderImage:[UIImage imageNamed:@"jijiehao"]];
    [self.laughBtn setImage:imageV6.image forState:UIControlStateNormal];
    
    UIImageView *imageV7 = [[UIImageView alloc] init];
    NSURL *url7 = [NSURL URLWithString:classify.icon7];
    [imageV7 sd_setImageWithURL:url7 placeholderImage:[UIImage imageNamed:@"renshini"]];
    [self.jinliaoBtn setImage:imageV7.image forState:UIControlStateNormal];

}

//- (void)setClassifys:(NSMutableArray *)classifys
//{
//    _classifys = [NSMutableArray array];
//    _classifys = classifys;
//    
//    NSLog(@"%@",_classifys);
//    
//    UIImageView *imageV = [[UIImageView alloc] init];
//    ZSMDClassify *classify= _classifys;
//    NSURL *url = [NSURL URLWithString:classify.icon];
//    [imageV sd_setImageWithURL:url];
//    [self.introduceBtn setImage:imageV.image forState:UIControlStateNormal];
//
//    
//}


- (void)awakeFromNib
{
    [self.introduceBtn setTitle:@"学校介绍" forState:UIControlStateNormal];
    [self.chuangxinBtn setTitle:@"创新中心" forState:UIControlStateNormal];
    [self.zixunBtn setTitle:@"校园资讯" forState:UIControlStateNormal];
    [self.mapBtn setTitle:@"地图导航" forState:UIControlStateNormal];
    [self.listenBtn setTitle:@"校园随身听" forState:UIControlStateNormal];
    [self.lookBtn setTitle:@"i看看" forState:UIControlStateNormal];
    [self.laughBtn setTitle:@"集结号" forState:UIControlStateNormal];
    [self.jinliaoBtn setTitle:@"好想认识你" forState:UIControlStateNormal];

}

@end
