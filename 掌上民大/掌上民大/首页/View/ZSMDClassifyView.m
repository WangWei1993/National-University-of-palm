//
//  ZSMDClassifyView.m
//  掌上民大
//
//  Created by 王伟 on 16/3/14.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassifyView.h"
#import "ZSMDClassify.h"

@interface ZSMDClassifyView()


@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation ZSMDClassifyView

+ (instancetype)classify
{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


- (void)setClassify:(ZSMDClassify *)classify
{
    _classify = classify;
    
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    
    self.icon.image = [UIImage imageNamed:classify.icon];
    self.name.text = classify.name;
}

//- (void)awakeFromNib
//{
//    /**
//     *  添加内部子控件
//     */
//    
//    self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT * 0.3);
//    
//    // 0 初始化
//    CGFloat marginW = self.frame.size.width * 0.08;
//    CGFloat marginH = self.frame.size.height * 0.05;
//    CGFloat width = self.frame.size.width - 5 * marginW; // 一共5个间隙
//    CGFloat height = self.frame.size.height - 3 * marginH;
//    
//   
//    NSLog(@"%@,%f",NSStringFromCGRect(self.frame),SCREENWIDTH);
//    
//    // 1.学校概况
//    UIView *view00 = [[UIView alloc] init];
//    view00.backgroundColor = [UIColor redColor];
////    self.view00 = view00;
//    [self addSubview:view00];
//    [view00 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(width * 0.15);
//        make.height.mas_equalTo(height  * 0.425);
//        make.left.mas_equalTo(self.mas_right).offset(marginW);
//        make.top.mas_equalTo(self).offset(marginH);
//    }];
//    
//    // 2.大学生实践创新中心
//    UIView *view01 = [[UIView alloc] init];
//    view01.backgroundColor = [UIColor grayColor];
////    self.view01 = view01;
//    [self addSubview:view01];
//    [view01 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view00.mas_right).offset(marginH);
//        make.top.mas_equalTo(view00);
//    }];
//    
//    // 3.校园资讯
//    UIView *view02 = [[UIView alloc] init];
//    view02.backgroundColor = [UIColor orangeColor];
////    self.view02 = view02;
//    [self addSubview:view02];
//    [view02 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view01.mas_right).offset(marginH);
//        make.top.mas_equalTo(view00);
//    }];
//    
//    // 4.地图导航
//    UIView *view03 = [[UIView alloc] init];
//    view03.backgroundColor = [UIColor blackColor];
////    self.view03 = view03;
//    [self addSubview:view03];
//    [view03 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view02.mas_right).offset(marginH);
//        make.top.mas_equalTo(view00);
//    }];
//    
//    // 5.校园随身听
//    UIView *view10 = [[UIView alloc] init];
////    self.view10 = view10;
//    [self addSubview:view10];
//    [view10 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view00);
//        make.top.mas_equalTo(view00.mas_bottom).offset(marginH);
//    }];
//    
//    // 6.i看看
//    UIView *view11 = [[UIView alloc] init];
////    self.view11 = view11;
//    [self addSubview:view11];
//    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view10.mas_right).offset(marginH);
//        make.top.mas_equalTo(view10);
//    }];
//    
//    // 7.iMovice
//    UIView *view12 = [[UIView alloc] init];
////    self.view12 = view12;
//    [self addSubview:view12];
//    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view11.mas_right).offset(marginH);
//        make.top.mas_equalTo(view10);
//    }];
//    
//    // 8.近聊
//    UIView *view13 = [[UIView alloc] init];
////    self.view13 = view13;
//    [self addSubview:view13];
//    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(view00);
//        make.height.mas_equalTo(view00);
//        make.left.mas_equalTo(view12.mas_right).offset(marginH);
//        make.top.mas_equalTo(view10);
//    }];

//}
@end
