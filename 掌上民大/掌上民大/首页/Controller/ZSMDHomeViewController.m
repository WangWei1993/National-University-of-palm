//
//  ZSMDHomeViewController.m
//  掌上民大
//
//  Created by 王伟 on 16/3/11.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHomeViewController.h"
#import "ZSMDBanner.h"
#import "ZSMDBannerCell.h"
#import "ZSMDClassifyCell.h"
#import "ZSMDSectionCell.h"
#import "ZSMDHotNewsCell.h"
#import "ZSMDIMovieCell.h"
#import "ZSMDILookCell.h"
#import "ZSMDListenCell.h"
#import "ZSMDHomeFooter.h"
#import "ZSMDSection.h"
#import "ZSMDHomeNavBar.h"

@interface ZSMDHomeViewController () <UITableViewDataSource,UITableViewDelegate>

/** sectionCell */
@property (nonatomic, strong) NSArray *arrSections;

/** ZSMDHomeNavBar */
@property (nonatomic, weak) ZSMDHomeNavBar *homeNavBar;

@end

@implementation ZSMDHomeViewController


// 介绍数组-懒加载
- (NSArray *)arrSections
{
    if (_arrSections == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"sectionCell" ofType:@"plist"];
        
        NSMutableArray *arrCells = [NSMutableArray array];
        NSArray *arrDic = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in arrDic) {
            ZSMDSection *introduce = [ZSMDSection sectionWithDict:dic];
            [arrCells addObject:introduce];
        }
        _arrSections = arrCells;
    }
    return _arrSections;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 1. 将系统导航栏隐藏，添加自定义的导航栏
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    self.navigationController.navigationBarHidden = YES;
//    [self setHomeNavBar];
    
    // 将tableView置顶显示
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // cell的分割线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 去掉tableView的滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 设置tableView的背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
    
}


#pragma mark - 添加自定义的导航栏
- (void)setHomeNavBar
{
    ZSMDHomeNavBar *homeNavBar = [ZSMDHomeNavBar homeNavBar];
    self.homeNavBar = homeNavBar;
    [self.tableView insertSubview:homeNavBar aboveSubview:self.tableView];
    
    [self.homeNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(self.tableView);
        make.left.mas_equalTo(self.tableView);
    }];
    
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1 || section == 2) {
        return 6;
    } else if (section == 5) {
        return 3;
    }
    return 2;
   
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {                // 图片浏览器
            // 1.定义cell
            ZSMDBannerCell *cell = [ZSMDBannerCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else {                                 // 分类
        
            // 1.定义cell
            ZSMDClassifyCell *cell = [ZSMDClassifyCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
        
    
    }  else if (indexPath.section == 1) {
        if (indexPath.row == 0) {               // 热门资讯-标题
            
            // 1.定义cell
            ZSMDSectionCell *cell = [ZSMDSectionCell cellWithTableView:tableView];
            ZSMDSection *section = self.arrSections[0];
            cell.section = section;
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else {                                // 热门资讯-内容
            
            // 1.定义cell
            ZSMDHotNewsCell *cell = [ZSMDHotNewsCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
     
   
    } else if (indexPath.section == 2){
        
        if (indexPath.row == 0) {              // 创新中心资讯-标题
            // 1.定义cell
            ZSMDSectionCell *cell = [ZSMDSectionCell cellWithTableView:tableView];
            ZSMDSection *section = self.arrSections[1];
            cell.section = section;
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else {                               // 创新中心资讯-内容
            // 1.定义cell
            ZSMDHotNewsCell *cell = [ZSMDHotNewsCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
        
        
    } else if (indexPath.section == 3){
        if (indexPath.row == 0) {              // 校园随身听-标题
            // 1.定义cell
            ZSMDSectionCell *cell = [ZSMDSectionCell cellWithTableView:tableView];
            ZSMDSection *section = self.arrSections[2];
            cell.section = section;
           
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else {                               // 校园随身听-内容
            // 1.定义cell
            ZSMDListenCell *cell = [ZSMDListenCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
    } else if (indexPath.section == 4){
        if (indexPath.row == 0) {              // 视频（iMoive）-标题
            // 1.定义cell
            ZSMDSectionCell *cell = [ZSMDSectionCell cellWithTableView:tableView];
            ZSMDSection *section = self.arrSections[3];
            cell.section = section;
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else {                               // 视频（iMoive）-内容
            // 1.定义cell
            ZSMDIMovieCell *cell = [ZSMDIMovieCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
    
    } else {
        if (indexPath.row == 0) {              // 图片(iLook)-标题
            // 1.定义cell
            ZSMDSectionCell *cell = [ZSMDSectionCell cellWithTableView:tableView];
            ZSMDSection *section = self.arrSections[4];
            cell.section = section;
            // 2.传入数据
            // 3.返回cell
            return cell;
            
        } else if (indexPath.row == 1) {                               //图片(iLook)-内容
            // 1.定义cell
            ZSMDILookCell *cell = [ZSMDILookCell cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        } else {
            // 1.定义cell
            ZSMDHomeFooter *cell = [ZSMDHomeFooter cellWithTableView:tableView];
            // 2.传入数据
            // 3.返回cell
            return cell;
        }
    }
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    if (section == 5) {
//        ZSMDHomeFooter *footer = [ZSMDHomeFooter footer];
//        footer.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
//        return footer;
//    } else {
//        return nil;
//    }
//}
//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5;
    
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {     // 图片浏览器
            return 0.3 * SCREENHEIGHT;
        } else {                      // 分类
            return 0.3 * SCREENHEIGHT;
        }
    } if (indexPath.section == 1) {  // 热门资讯-标题
        if (indexPath.row == 0) {
            return 0.05 * SCREENHEIGHT;
        } else {                     // 热门资讯
            return 0.13 * SCREENHEIGHT;
        }
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {    // 创新中心资讯-标题
            return 0.05 * SCREENHEIGHT;
        } else {                     // 创新中心资讯
            return 0.13 * SCREENHEIGHT;
        }
    } else if (indexPath.section == 3){
        if (indexPath.row == 0) {    // 校园随身听-标题
            return 0.05 * SCREENHEIGHT;
        } else {                     // 校园随身听
            return 0.15 * SCREENHEIGHT;
        }
    } else if (indexPath.section == 4){
        if (indexPath.row == 0) {     // 视频（iMoive）-标题
            return 0.05 * SCREENHEIGHT;
        } else {                      // 视频（iMoive）
            return 0.7 * SCREENHEIGHT;
        }
    }else {                           // 图片(iLook)-标题
        if (indexPath.row == 0) {
            return 0.05 * SCREENHEIGHT;
        } else if (indexPath.row == 1) { // 图片(iLook)
            return 0.30 * SCREENHEIGHT;
        } else {                       // footer
            return 0.085 *SCREENHEIGHT;
        }
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y * 1.0 == 0) {
        self.navigationController.navigationBar.alpha = 1;
    }
    self.navigationController.navigationBar.alpha = scrollView.contentOffset.y * 1.0 / 44;
    NSLog(@"%f",self.navigationController.navigationBar.alpha);
}

@end
