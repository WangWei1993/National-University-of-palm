//
//  ZSMDTabBarView.m
//  掌上民大
//
//  Created by 王伟 on 16/3/25.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDTabBarView.h"
#import "ZSMDTabBarButton.h"

@interface ZSMDTabBarView ()

// 整个tabbar
@property(nonatomic,weak) UIImageView *tabbarView;
// 发布按钮View
@property(nonatomic,weak) UIImageView *tabbarViewCenter;
// 发布文字
@property (nonatomic, weak) UILabel *label;

@property(nonatomic,weak) ZSMDTabBarButton *button_1;
@property(nonatomic,weak) ZSMDTabBarButton *button_2;
@property(nonatomic,weak) ZSMDTabBarButton *button_3;
@property(nonatomic,weak) ZSMDTabBarButton *button_4;
// 发布按钮
@property(nonatomic,weak) ZSMDTabBarButton *button_center;

@end

@implementation ZSMDTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self layoutView];
        
    }
    return self;
}
-(void)layoutView
{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.png"]];
    self.tabbarView = imageV;
    [_tabbarView setFrame:CGRectMake(0, 0, SCREENWIDTH, 48)];
    [_tabbarView setUserInteractionEnabled:YES];
    
    UIImageView *centerImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5.png"]];
    self.tabbarViewCenter = centerImageV;
    
    _tabbarViewCenter.center = CGPointMake(self.tabbarView.center.x, 5);
    
    [_tabbarViewCenter setUserInteractionEnabled:YES];
    
    
    ZSMDTabBarButton *button_center = [ZSMDTabBarButton buttonWithType:UIButtonTypeCustom];
    [button_center addTarget:self action:@selector(btnCenter) forControlEvents:UIControlEventTouchUpInside];
    _button_center = button_center;
    _button_center.adjustsImageWhenHighlighted = YES;
    [_button_center setBackgroundImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
    
    [_button_center setFrame:CGRectMake(0, 0, 46, 46)];
    
    _button_center.center =CGPointMake(_tabbarViewCenter.bounds.size.width/2.0, _tabbarViewCenter.bounds.size.height/2.0 + 5) ;
    
    [_tabbarViewCenter addSubview:_button_center];
    
    [self addSubview:imageV];
    [self addSubview:centerImageV];
    
    [self layoutBtn];
    
}
- (void)btnCenter{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addBtn" object:nil];
}


-(void)layoutBtn
{
    ZSMDTabBarButton *btn1 = [ZSMDTabBarButton buttonWithType:UIButtonTypeCustom];
    _button_1 = btn1;
    [btn1 setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    [btn1 setTitle:@"首页" forState:UIControlStateNormal];
    _button_1.frame = CGRectMake(0, 0, SCREENWIDTH * 0.2, 48);
    [_button_1 setTag:101];
    [_button_1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    ZSMDTabBarButton *btn2 = [ZSMDTabBarButton buttonWithType:UIButtonTypeCustom];
    _button_2 = btn2;
    _button_2.frame = CGRectMake(SCREENWIDTH * 0.2,  0, SCREENWIDTH * 0.2, 48);
    [_button_2 setTag:102];
    [_button_2 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    ZSMDTabBarButton *btn3 = [ZSMDTabBarButton buttonWithType:UIButtonTypeCustom];
    _button_3 = btn3;
    btn3.backgroundColor = [UIColor greenColor];
    _button_3.frame = CGRectMake(SCREENWIDTH * 0.2 * 3, 0, SCREENWIDTH * 0.2, 48);
    [_button_3 setTag:103];
    [_button_3 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    ZSMDTabBarButton *btn4 = [ZSMDTabBarButton buttonWithType:UIButtonTypeCustom];
    btn4.backgroundColor = [UIColor redColor];
    _button_4 = btn4;
    _button_4.frame = CGRectMake(SCREENWIDTH * 0.2 * 4, 0, SCREENWIDTH * 0.2, 48);
    [_button_4 setTag:104];
    [_button_4 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [_tabbarView addSubview:btn1];
    [_tabbarView addSubview:btn2];
    [_tabbarView addSubview:btn3];
    [_tabbarView addSubview:btn4];
    
}

-(void)btn1Click:(id)sender
{
    
    UIButton *btn = (UIButton *)sender;
    
    switch (btn.tag) {
        case 101:
        {
            [_tabbarView setImage:[UIImage imageNamed:@"1.png"]];
            [self.delegate tabBarTouchBtnAtIndex:0];
            
            break;
        }
        case 102:
        {
            [_tabbarView setImage:[UIImage imageNamed:@"2.png"]];
            [self.delegate tabBarTouchBtnAtIndex:1];
            
            break;
        }
        case 103:
            [_tabbarView setImage:[UIImage imageNamed:@"3.png"]];
            [self.delegate tabBarTouchBtnAtIndex:2];
            
            
            break;
            
        case 104:
            [_tabbarView setImage:[UIImage imageNamed:@"4.png"]];
            [self.delegate tabBarTouchBtnAtIndex:3];
            
            break;
        default:
            break;
    }
}




@end
