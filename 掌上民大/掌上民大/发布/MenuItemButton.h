//
//  MenuItemButton.h
//  01-微博动画
//
//  Created by xiaomage on 15/6/26.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItemButton;

@protocol MenulItemButtonDelegate <NSObject>

- (void)buttonDidMenuItemButton:(MenuItemButton *)button;

@end

@interface MenuItemButton : UIButton

// 修改按钮内部子控件的位置
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//
//}

//- (CGRect)titleRectForContentRect:(CGRect)contentRect

/** 代理属性 */
@property (nonatomic, weak) id<MenulItemButtonDelegate> delegate;

@end
