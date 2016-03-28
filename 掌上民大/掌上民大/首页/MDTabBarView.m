//
//  MDTabBarView.m
//  西北民族大学
//
//  Created by wangwei on 15/7/27.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
// 给plusButton按钮添加监听

#import "MDTabBarView.h"
#import "UIImage+MDImage.h"
#import "MDTabBarButton.h"
//#import "MDNavigationController.h"
#import "WCNavigationController.h"
#import "ComposeItemView.h"



@interface MDTabBarView() <UINavigationControllerDelegate>

@property(nonatomic,strong)NSMutableArray *muTableButton;

@property(nonatomic, weak) MDTabBarButton *selectedButton;

// 中间按钮
@property (nonatomic, weak) MDTabBarButton *button_center;

@property(nonatomic) BOOL shown;

@end

@implementation MDTabBarView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


- (NSMutableArray *)muTableButton
{
    if (_muTableButton == nil) {
        _muTableButton = [NSMutableArray array];
    }
    return _muTableButton;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    MDTabBarButton *btn = [[MDTabBarButton alloc] init];
    [self addSubview:btn];
    
    if (self.subviews.count == 2) {
        MDTabBarButton *button_center = [MDTabBarButton buttonWithType:UIButtonTypeCustom];
        [button_center setBackgroundColor:[UIColor redColor]];
        [button_center setBackgroundImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
        [button_center addTarget:self action:@selector(centerBtn) forControlEvents:UIControlEventTouchUpInside];
        self.button_center = button_center;
        [self addSubview:button_center];

    }
    
    //添加button到muTableButton （与subviews进行区分）
    [self.muTableButton addObject:btn];
    
    //将按键的内部封装起来
    btn.item = item;
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //选择默认的button
    if (self.muTableButton.count == 1) {
        [self buttonClick:btn];
    }
}

// 点击中间按钮
- (void)centerBtn
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    ComposeItemView *view = [[ComposeItemView alloc] initWithFrame:window.bounds];
    view.backgroundColor = [UIColor redColor];
    [window addSubview:view];
}

//
- (void)buttonClick:(MDTabBarButton *)button
{
    //告诉代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didButtonClickWithFrom:to:)]) {
        [self.delegate tabBar:self didButtonClickWithFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
   
    //设置按键状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count ;
    CGFloat buttonY = 0;
    
    // 四个子控制器的按钮
    for (int index = 0; index < self.subviews.count; index++) {
        
        // 1.取出按钮
        MDTabBarButton *button = self.subviews[index];
        
        
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        if (index == 2) {
            // 2.设置按钮的frame
            CGFloat buttonX = index * buttonW;
            button.frame = CGRectMake(buttonX, - buttonH * 0.2, buttonW, buttonH);
        }
        
        // 3.绑定tag
        button.tag = index;
        
    }
    
//    for (int index = 2; index < 4; index++) {
//        // 1.取出按钮
//        MDTabBarButton *button = self.subviews[index];
//        
//        // 2.设置按钮的frame
//        CGFloat buttonX = (index + 2) * buttonW;
//        button.frame = CGRectMake(buttonX , buttonY, buttonW, buttonH);
//        
//        // 3.绑定tag
//        button.tag = index;
//        
//    }
    
    // 创建中间按钮
    // 中间按钮
//    MDTabBarButton *button_center = [MDTabBarButton buttonWithType:UIButtonTypeCustom];
//    self.button_center = button_center;
//    [self addSubview:button_center];
//    //    [button_center addTarget:self action:@selector(btnCenter) forControlEvents:UIControlEventTouchUpInside];
//    _button_center.adjustsImageWhenHighlighted = YES;
//    [_button_center setBackgroundColor:[UIColor redColor]];
//    [_button_center setBackgroundImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
//    [_button_center setFrame:CGRectMake(self.center.x , -30, 46, 46)];
//
//}



}

@end
