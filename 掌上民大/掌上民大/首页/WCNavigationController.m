
//  WCNavigationController.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCNavigationController.h"

@implementation WCNavigationController


+(void)initialize{
   
    
    
}


// 设置导航栏的主题
+(void)setupNavTheme{
    // 设置导航样式
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 1.设置导航条的背景
    
    // 高度不会拉伸，但是宽度会拉伸
    [navBar setBackgroundImage:[UIImage imageNamed:@"tabBar_backg"] forBarMetrics:UIBarMetricsDefault];
    
    // 2.设置栏的字体
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor whiteColor];
    att[NSFontAttributeName] = [UIFont systemFontOfSize:18];

    [navBar setTitleTextAttributes:att];
    
    // 设置箭头的颜色
//    navBar.barTintColor = [UIColor whiteColor];
    navBar.tintColor = [UIColor whiteColor];
//    navBar.translucent = NO;
    
    // 设置状态栏的样式
    // xcode5以上，创建的项目，默认的话，这个状态栏的样式由控制器决定
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}


//导航栏按钮主题
+ (void)setupBarButtonItem
{
    // 设置整个项目所有Item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态下的字体 (绘制文本)
    NSDictionary *dic = @{
                          NSFontAttributeName :[UIFont systemFontOfSize:16],//设置字体大小
                          NSForegroundColorAttributeName: [UIColor whiteColor],//字体颜色
                          };
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    // 设置不可用状态下的字体 (绘制文本)
    NSDictionary *disDic = @{
                             NSFontAttributeName :[UIFont systemFontOfSize:16],//设置字体大小
//                             NSForegroundColorAttributeName:MDColor(78, 78, 78),//字体颜色
                             };
    
    [item setTitleTextAttributes:disDic forState:UIControlStateDisabled];
}

////结果，如果控制器是由导航控制管理，设置状态栏的样式时，要在导航控制器里设置
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
@end
