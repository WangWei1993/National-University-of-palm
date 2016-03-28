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
#import "MenuItem.h"
#import "ComposeItemView.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

@interface ZSMDTabBarController () <ZSMDTabBarViewDelegate>


@property(nonatomic,strong) NSArray *arrayViewcontrollers;

@end

@implementation ZSMDTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 接受通知
    // 监听（发布）通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present0) name:@"btn0" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present1) name:@"btn1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present2) name:@"btn2" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present3) name:@"btn3" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present4) name:@"btn4" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(present5) name:@"btn5" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addBtn) name:@"addBtn" object:nil];
    
    // Do any additional setup after loading the view.
    CGFloat orginHeight = self.view.frame.size.height- 48;
    ZSMDTabBarView *tabbar = [[ZSMDTabBarView alloc]initWithFrame:CGRectMake(0,  orginHeight, SCREENWIDTH, 48)];
    _tabbar = tabbar;
    _tabbar.delegate = self;
    
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


#pragma mark -  执行通知-
- (void)addBtn{
    
    // 创建模型对象
    MenuItem *item = [MenuItem itemWithTitle:@"实时校园" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    MenuItem *item1 = [MenuItem itemWithTitle:@"吐槽食堂" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    MenuItem *item2 = [MenuItem itemWithTitle:@"闲置" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    MenuItem *item3 = [MenuItem itemWithTitle:@"失物招领" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    MenuItem *item4 = [MenuItem itemWithTitle:@"兼职" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    MenuItem *item5 = [MenuItem itemWithTitle:@"投票" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    
//    ComposeItemViewController *vc = [[ComposeItemViewController alloc] init];
//    vc.items = @[item,item1,item2,item3,item4,item5];
//    
//    [self presentViewController:vc animated:NO completion:nil];
}
// 发布控制器
- (void)present0
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}

// 发布控制器
- (void)present1
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self presentViewController:vc animated:YES completion:nil];
}

// 发布控制器
- (void)present2
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self presentViewController:vc animated:YES completion:nil];
}

// 发布控制器
- (void)present3
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:vc animated:YES completion:nil];
}

// 发布控制器
- (void)present4
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self presentViewController:vc animated:YES completion:nil];
}

// 发布控制器
- (void)present5
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn0" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn1" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn2" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn3" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn4" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"btn5" object:nil];
}


@end
