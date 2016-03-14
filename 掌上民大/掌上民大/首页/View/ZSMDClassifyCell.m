//
//  ZSMDClassifyCell.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassifyCell.h"
#import "ZSMDClassifyView.h"

@interface ZSMDClassifyCell()
@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view00;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view01;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view02;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view03;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view10;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view11;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view12;

@property (weak, nonatomic) IBOutlet ZSMDClassifyView *view13;
@end

@implementation ZSMDClassifyCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"classifyCell";
    ZSMDClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
//    }
//    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    cell.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT * 0.3);
    
    
    return cell;
    
}


- (void)awakeFromNib
{
    ZSMDClassifyView *classifyView = [ZSMDClassifyView classify];
    [classifyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREENWIDTH );
        make.height.mas_equalTo(SCREENHEIGHT * 0.3 );
//        make.left.mas_equalTo(self);
//        make.right.mas_equalTo(self);
    }];
    NSLog(@"%@",NSStringFromCGRect(classifyView.frame));
    [self addSubview:classifyView];
    /**
     *  添加内部子控件
     */
    
    // 0 初始化
    CGFloat marginW = self.frame.size.width * 0.08;
    CGFloat marginH = self.frame.size.height * 0.05;
    CGFloat width = self.frame.size.width - 5 * marginW; // 一共5个间隙
    CGFloat height = self.frame.size.height - 3 * marginH;
    NSLog(@"%@,%f",NSStringFromCGRect(self.frame),SCREENWIDTH);
    
    // 1.学校概况
    ZSMDClassifyView *view00 = [ZSMDClassifyView classify];
    self.view00 = view00;
    [self addSubview:view00];
    [view00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width * 0.15);
        make.height.mas_equalTo(height  * 0.425);
        make.left.mas_equalTo(self.mas_right).offset(marginW);
        make.top.mas_equalTo(self).offset(marginH);
    }];
    
    // 2.大学生实践创新中心
     ZSMDClassifyView *view01 = [ZSMDClassifyView classify];
    self.view01 = view01;
    [self addSubview:view01];
    [view01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view00.mas_right).offset(marginH);
        make.top.mas_equalTo(view00);
    }];
    
    // 3.校园资讯
     ZSMDClassifyView *view02 = [ZSMDClassifyView classify];
    self.view02 = view02;
    [self addSubview:view02];
    [view02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view01.mas_right).offset(marginH);
        make.top.mas_equalTo(view00);
    }];
    
    // 4.地图导航
     ZSMDClassifyView *view03 = [ZSMDClassifyView classify];
    self.view03 = view03;
    [self addSubview:view03];
    [view03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view02.mas_right).offset(marginH);
        make.top.mas_equalTo(view00);
    }];
    
    // 5.校园随身听
     ZSMDClassifyView *view10 = [ZSMDClassifyView classify];
    self.view10 = view10;
    [self addSubview:view10];
    [view10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view00);
        make.top.mas_equalTo(view00.mas_bottom).offset(marginH);
    }];
    
    // 6.i看看
     ZSMDClassifyView *view11 = [ZSMDClassifyView classify];
    self.view11 = view11;
    [self addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view10.mas_right).offset(marginH);
        make.top.mas_equalTo(view10);
    }];
    
    // 7.iMovice
     ZSMDClassifyView *view12 = [ZSMDClassifyView classify];
    self.view12 = view12;
    [self addSubview:view12];
    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view11.mas_right).offset(marginH);
        make.top.mas_equalTo(view10);
    }];
    
    // 8.近聊
     ZSMDClassifyView *view13 = [ZSMDClassifyView classify];
    self.view13 = view13;
    [self addSubview:view13];
    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view00);
        make.height.mas_equalTo(view00);
        make.left.mas_equalTo(view12.mas_right).offset(marginH);
        make.top.mas_equalTo(view10);
    }];
}

@end
