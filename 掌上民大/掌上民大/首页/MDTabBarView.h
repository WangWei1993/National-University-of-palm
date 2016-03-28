//
//  MDTabBarView.h
//  西北民族大学
//
//  Created by wangwei on 15/7/27.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDTabBarView;

@protocol MDTabBarViewDelegata <NSObject>

@optional
- (void)tabBar:(MDTabBarView *)tabBar didButtonClickWithFrom:(int)from to:(int)to;

- (void)didButtonClick;

@end


@interface MDTabBarView : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property(nonatomic, weak)id<MDTabBarViewDelegata> delegate;

@end
