//
//  ZSMDTabBarView.h
//  掌上民大
//
//  Created by 王伟 on 16/3/25.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZSMDTabBarViewDelegate <NSObject>
// 代理方法
-(void)tabBarTouchBtnAtIndex:(NSInteger)index;

@end

@interface ZSMDTabBarView : UIView
// 代理属性
@property(nonatomic,weak) id<ZSMDTabBarViewDelegate> delegate;

@end
