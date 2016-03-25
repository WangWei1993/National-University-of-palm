//
//  ZSMDTabBarController.m
//  掌上民大
//
//  Created by 王伟 on 16/3/25.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDTabBarController.h"
#import "ZSMDTabBarView.h"
#import "ZSMDHomeNavController.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

@interface ZSMDTabBarController () <ZSMDTabBarViewDelegate>

@property(nonatomic,weak) ZSMDTabBarView *tabbar;
@property(nonatomic,strong) NSArray *arrayViewcontrollers;

@end

@implementation ZSMDTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat orginHeight = self.view.frame.size.height- 48;
    ZSMDTabBarView *tabbar = [[ZSMDTabBarView alloc]initWithFrame:CGRectMake(0,  orginHeight, SCREENWIDTH, 48)];
    _tabbar = tabbar;
    _tabbar.delegate = self;
    
//    self.tabBar.hidden = YES;
    
    [self.view addSubview:_tabbar];
    
    _arrayViewcontrollers = [self getViewcontrollers];
    [self tabBarTouchBtnAtIndex:0];
    
}


- (NSArray *) getViewcontrollers
{
    NSArray* tabBarItems = nil;
    ZSMDHomeNavController *first = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    SecondViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    ThreeViewController *three=[self.storyboard instantiateViewControllerWithIdentifier:@"three"];
    FourViewController *four=[self.storyboard instantiateViewControllerWithIdentifier:@"four"];
    
    tabBarItems = [NSArray arrayWithObjects:
                   [NSDictionary dictionaryWithObjectsAndKeys:first, @"viewController", nil],
                   [NSDictionary dictionaryWithObjectsAndKeys: second, @"viewController", nil],
                   [NSDictionary dictionaryWithObjectsAndKeys:three, @"viewController", nil],
                   [NSDictionary dictionaryWithObjectsAndKeys:four, @"viewController", nil],
                   nil];
    return tabBarItems;
}

-(void)tabBarTouchBtnAtIndex:(NSInteger)index
{
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    NSDictionary* data = [_arrayViewcontrollers objectAtIndex:index];
    UIViewController *viewController = data[@"viewController"];
    viewController.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height- 50);
    [self.view insertSubview:viewController.view belowSubview:_tabbar];				//插入视图
}




@end
