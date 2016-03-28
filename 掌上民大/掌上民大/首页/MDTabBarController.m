//
//  MDTabBarViewController.m
//  西北民族大学
//
//  Created by wangwei on 15/7/25.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//



#import "MDTabBarController.h"
#import "ZSMDHomeViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
//#import "SearchViewController.h"
#import "UIImage+MDImage.h"
#import "MDTabBarView.h"
//#import "MDNavigationController.h"
#import "WCNavigationController.h"
//#import "FDActionSheet.h"
#import "ThreeViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MDTabBarController ()<MDTabBarViewDelegata, CLLocationManagerDelegate>

@property (nonatomic, weak)MDTabBarView *costomTabBar;

@property(nonatomic, strong)UIView *messView;

@end
@implementation MDTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    /**
     *  基本层次关系：最下面是系统的是tabBar，上面是自定义的View，再上面是自定义的button，最上面的系统的tabBar上面的button。                                         
     然后调用viewWillAppear方法，将系统tabBar上的button给移除。
     */
    //创建自定义TabBar
    [self setupCostomTabBarView];
    
    //初始化子控制器
    [self setupAllChildViewController];
}


/**
 *  初始化自定义TabBar
 */
- (void)setupCostomTabBarView
{
    MDTabBarView *costomTabBarView = [[MDTabBarView alloc] init];
    costomTabBarView.frame = self.tabBar.bounds;
    [self.tabBar addSubview:costomTabBarView];
    self.costomTabBar = costomTabBarView;
    
    //将自定义的tabBar代理设为控制器
    costomTabBarView.delegate = self;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"%@",self.tabBar.subviews);
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}


/**
 *  初始化子控制器
 */
- (void)setupAllChildViewController
{
    //home
    ZSMDHomeViewController *home = [[ZSMDHomeViewController alloc] init];
    
    [self setupChildViewController:home title:@"首页" imageName:@"navbar_icon_home_normal" selectedImageName:@"navbar_icon_home_selected"];
    
    // 集结号
    ZSMDHomeViewController *message = [[ZSMDHomeViewController alloc] init];
//    message.tabBarItem.badgeValue = @"100";
    [self setupChildViewController:message title:@"集结号" imageName:@"navbar_icon_channel_normal" selectedImageName:@"navbar_icon_channel_selected"];
    
    //me
    ZSMDHomeViewController *me = [[ZSMDHomeViewController alloc] init];
    [self setupChildViewController:me title:@"消息" imageName:@"navbar_icon_user_normal" selectedImageName:@"navbar_icon_user_selected"];
    
    //me
    ZSMDHomeViewController *me1 = [[ZSMDHomeViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"navbar_icon_user_normal" selectedImageName:@"navbar_icon_user_selected"];
}


/**
 *  创建tabBarViewController的子控制器
 *
 *  @param childVc           子控制器的名字
 *  @param title             子控制器名字
 *  @param imageName         子控制器tabBar的图片
 *  @param selectedImageName 子控制器tabBar的选中图片
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    WCNavigationController *nav = [[WCNavigationController alloc] init];
    [nav addChildViewController:childVc];
    [self addChildViewController:nav];
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //每创建一个子控制器，都创建一个相对应的按钮
    [self.costomTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

- (void)tabBar:(MDTabBarView *)tabBar didButtonClickWithFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

#pragma mark - CLLocationManagerDelegate


@end
