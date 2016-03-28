//
//  ComposeItemViewController.m
//  01-微博动画
//
//  Created by xiaomage on 15/6/26.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ComposeItemView.h"
#import "MenuItem.h"
#import "MenuItemButton.h"
@interface ComposeItemView ()


@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak) NSTimer *timerEnd;
@property (nonatomic, weak) NSTimer *timerCompose;
@property (nonatomic, assign) int btnIndex;
@property (nonatomic, strong) NSMutableArray *itemButtons;

@end

@implementation ComposeItemView

// 将两个定时器 释放
- (void)dealloc
{
    [_timer invalidate];
    [_timerEnd invalidate];
    [_timerCompose invalidate];
}

- (NSMutableArray *)itemButtons
{
    if (_itemButtons == nil) {
        _itemButtons = [NSMutableArray array];
    }
    return _itemButtons;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame] ) {
        
        MenuItem *item0 = [MenuItem itemWithTitle:@"实时校园" image:[UIImage imageNamed:@"tabbar_compose_review"]];
        MenuItem *item1 = [MenuItem itemWithTitle:@"失物招领" image:[UIImage imageNamed:@"tabbar_compose_more"]];
        MenuItem *item2 = [MenuItem itemWithTitle:@"闲置" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
        MenuItem *item3 = [MenuItem itemWithTitle:@"晒食堂" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
        MenuItem *item4 = [MenuItem itemWithTitle:@"实习" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
        MenuItem *item5 = [MenuItem itemWithTitle:@"投票" image:[UIImage imageNamed:@"tabbar_compose_review"]];
        
        self.items = @[item0,item1,item2,item3,item4,item5];
        
        // 添加所有item按钮
        [self setUpAllBtns];
        
        // 动画定时器（）
        // 调用scheduledTimer返回的定时器，已经自动被添加runLoop中,而且是NSDefaultRunLoopMode
        __weak ComposeItemView *weakSelf = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:weakSelf selector:@selector(timeChange) userInfo:nil repeats:YES];
    }
    
    return self;
}

///*
// 按钮按顺序的从下往上偏移
// 
// */
- (void)timeChange
{
    // 让一个按钮做动画
    if (_btnIndex == self.itemButtons.count) {
        // 定时器停止
        [_timer invalidate];
      
        return;
    }
    
    // 获取按钮（定义一个变量来记录button的数字）
    UIButton *btn = self.itemButtons[_btnIndex];
    
    [self setUpOneBtnAnim:btn];
    
    _btnIndex++;
}

#pragma mark - 给所有的按钮做动画
- (void)setUpAllBtnAnim
{
    for (UIButton *btn in self.itemButtons) {
        
        [self setUpOneBtnAnim:btn];
        
    }
}

#pragma mark - 给一个按钮做动画
- (void)setUpOneBtnAnim:(UIButton *)btn
{
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        btn.transform = CGAffineTransformIdentity;
        
    } completion:nil];
    
}

#pragma mark - 添加所有item按钮
- (void)setUpAllBtns
{
    int cols = 3;
    int col = 0;
    int row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = 100;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - cols * wh) / (cols + 1);
    CGFloat oriY = 300;
    
    int count = 6;
    for (int i = 0; i < count; i++) {
        MenuItemButton *btn = [MenuItemButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        
        col = i % cols;
        row = i / cols;
        
        x = margin + col * (margin + wh);
        y = row * (margin + wh) + oriY;
        
        
        btn.frame = CGRectMake(x, y, wh, wh);
        
        // 设置按钮的图片和文字
        MenuItem *item = _items[i];
        
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        
        // 偏移到底部
        btn.transform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.itemButtons addObject:btn];
        
        [self addSubview:btn];
        
    }
}

// 点击放大
- (void)btnClick:(MenuItemButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    }];
}

// 松手后消失
- (void)btnClick1:(MenuItemButton *)btn
{
    [UIView animateWithDuration:0.4 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
        btn.alpha = 0;
        self.alpha = 0;
    }];
    
    // 点击后发出通知
    [self btnNotice:btn];

}

- (void)btnNotice:(MenuItemButton *)btn
{
    __weak ComposeItemView *weakSelf = self;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:weakSelf selector:@selector(remove) userInfo:0 repeats:NO];
    _timerEnd = timer;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        switch (btn.tag) {
            case 0:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn0" object:nil];
                break;
            }
            case 1:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn1" object:nil];
                break;
            }
            case 2:
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn2" object:nil];
                break;
                
            case 3:
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn3" object:nil];
                break;
                
            case 4:
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn4" object:nil];
                break;
                
            case 5:
                [[NSNotificationCenter defaultCenter] postNotificationName:@"btn5" object:nil];
                break;
            default:
                break;
        }

    });
    
}

// 点击界面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0;
    }];
    __weak ComposeItemView *weakSelf = self;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:weakSelf selector:@selector(remove) userInfo:0 repeats:NO];
    _timerCompose = timer;
}

// 移除界面
- (void)remove
{
    [_timerEnd invalidate];
    [_timerCompose invalidate];
    [self removeFromSuperview];
}



@end
