//
//  ZSMDButton.m
//  掌上民大
//
//  Created by 王伟 on 16/3/9.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDButton.h"
#import "Masonry.h"
#import "ZSMDIntroduce.h"


@interface ZSMDButton()

/** label1 */
@property (nonatomic,weak) UILabel *label1;

/** label2 */
@property (nonatomic, weak) UILabel *label2;

@end

@implementation ZSMDButton



+ (instancetype)button
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZSMDButton" owner:self options:nil] lastObject];
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        NSLog(@"%@",NSStringFromCGRect(frame));
//    }
//    return self;
//}


// 初始化里面的控件
- (void)awakeFromNib
{
    // 定义控件
    UIImageView *imageView = [[UIImageView alloc] init];
    UILabel *label1 = [[UILabel alloc] init];
    UILabel *label2 = [[UILabel alloc] init];
    label1.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;

    // 设置label字体
    label1.textColor = [UIColor whiteColor];
    label2.textColor = [UIColor whiteColor];
    [label1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [label2 setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:10]];
    
    self.label1 = label1;
    self.label2 = label2;
    
    // 添加进去
    [self addSubview:imageView];
    [self addSubview:label1];
    [self addSubview:label2];
    
    // 添加约束
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self.mas_centerY).offset(-10);
        make.leading.mas_equalTo(self);
        make.right.mas_equalTo(self);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label1.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        make.leading.mas_equalTo(self);
        make.right.mas_equalTo(self);
    }];
    
    // 协议
//    if ([self.delegate respondsToSelector:@selector(pushViewController:)]) {
//        [self.delegate pushViewController:self];
//    }
    
}


// set方法
- (void)setIntriduce:(ZSMDIntroduce *)intriduce
{

    self.label1.text = intriduce.title;
    self.label2.text = intriduce.detialTitle;
    
}


@end
