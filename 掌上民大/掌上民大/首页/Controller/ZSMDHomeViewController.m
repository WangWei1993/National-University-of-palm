//
//  ZSMDHomeViewController.m
//  掌上民大
//
//  Created by 王伟 on 16/3/11.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHomeViewController.h"
#import "ZYBannerView.h"
#import "ZSMDBanner.h"
#import "ZSMDBannerCell.h"
#import "ZSMDClassifyCell.h"
#import "ZSMDClassify.h"
#import "ZSMDSectionCell.h"
#import "ZSMDHotNewsCell.h"
#import "ZSMDHotNews.h"
#import "ZSMDIMovieCell.h"
#import "ZSMDILookCell.h"
#import "ZSMDListenCell.h"
#import "ZSMDHomeFooter.h"
#import "ZSMDSection.h"
#import "ZSMDHomeNavBar.h"
#import "WWButtonModel.h"
#import "WWButton.h"
#import "ZSMDBanner.h"
#import "MJChiBaoZiHeader.h"


#import "JATransitionNavigationBar.h"

@interface ZSMDHomeViewController () <UITableViewDataSource,UITableViewDelegate ,ZYBannerViewDataSource , ZYBannerViewDelegate>

/** sectionCell */
@property (nonatomic, strong) NSMutableArray *arrSections;

/** classify数组 */
@property (nonatomic, strong) ZSMDClassify *classify;

/** ZSMDHomeNavBar */
@property (nonatomic, weak) ZSMDHomeNavBar *homeNavBar;

/** 热门资讯 */
@property (nonatomic, strong) NSMutableArray *hotNews;

/** 热门资讯 */
@property (nonatomic, strong) NSMutableArray *centerNews;

/** banner */
@property (nonatomic, strong) ZYBannerView *bannerView;
/** banner */
@property (nonatomic, strong) NSMutableArray *banners;


@end

@implementation ZSMDHomeViewController

#pragma mark - 懒加载

// 校园热门-懒加载
- (NSMutableArray *)hotNews
{
    if (_hotNews == nil) {
        _hotNews = [NSMutableArray array];
    }
    return _hotNews;
}

// banner-懒加载
- (NSMutableArray *)banners
{
    if (_banners == nil) {
        _banners = [NSMutableArray array];
    }
    return _banners;
}

// sections-懒加载
- (NSMutableArray *)arrSections
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



#pragma mark - (void)viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // banner
    self.bannerView = [[ZYBannerView alloc] init];
    self.bannerView.dataSource = self;
    self.bannerView.delegate = self;
    self.bannerView.shouldLoop = YES;
    self.bannerView.autoScroll = YES;
    self.bannerView.frame = CGRectMake(0, 0, screen_width, 0.3 * SCREENHEIGHT);


    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 我也不知道为什么要加这句话
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 1. 添加自定义的导航栏
    [self.navigationController.navigationBar convertToTransitionBar:self.tableView useOffset:50.f];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:203.0/255.0 green:45.0/255.0 blue:50.0/255.0 alpha:1];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"掌上民大";
    label.frame = CGRectMake(0, 0, 50, 44);
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    
    // 将tableView置顶显示
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // cell的分割线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 去掉tableView的滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    // 设置tableView的背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
    
    // 刷新数据
    [self firstSetupRefresh];
    
}


#pragma  mark - 加载数据
-(void)loadNewData:(MJRefreshNormalHeader *)control{
    
    
    __weak typeof(self) weakself = self;
    // 查询数据
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"Hot"];
    BmobQuery *bquery1 = [BmobQuery queryWithClassName:@"classifyDicArr"];
    BmobQuery *bquery2 = [BmobQuery queryWithClassName:@"banner"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 查找Messages表的数据,返回的是字典数组
        [bquery2 calcInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            
            if (!error) {
                // 字典转为模型
                NSMutableArray *btnArr = [NSMutableArray array];
                
                for (NSDictionary *dic in array) {
                    // 创建MDMessage模型对象
                    ZSMDBanner *btnModel = [ZSMDBanner bannerWithDict:dic];
                    [btnArr addObject:btnModel];
                    NSLog(@"%@",btnModel.icon);
                }
                _banners = btnArr;
                
                
                // 刷新表格
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_bannerView reloadData];
                    
                    
                });
                
            }else{// 网络不通，提示不通
                NSLog(@"网络不通畅");
            }
        }];
        
    });

    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 查找Messages表的数据,返回的是字典数组
        [bquery1 calcInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            
            if (!error) {
                // 字典转为模型
                NSMutableArray *btnArr = [NSMutableArray array];
                
                for (NSDictionary *dic in array) {
                    // 创建MDMessage模型对象
                    ZSMDClassify *btnModel = [ZSMDClassify classifyWithDict:dic];
                    [btnArr addObject:btnModel];
                    
                }
                
                if (btnArr.count == 0) {
                    self.classify = [[ZSMDClassify alloc] init];
                }
                self.classify = btnArr[0];
                
                // 刷新表格
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakself.tableView reloadData];
                    
                });
                
            }else{// 网络不通，提示不通
                NSLog(@"网络不通畅");
            }
        }];

    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 查找Messages表的数据,返回的是字典数组
        [bquery  calcInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            
            if (!error) {
                // 字典转为模型
                NSMutableArray *btnArr = [NSMutableArray array];
                
                for (NSDictionary *dic in array) {
                    // 创建MDMessage模型对象
                    ZSMDHotNews *btnModel = [ZSMDHotNews hotNewsWithDict:dic];
                    [btnArr addObject:btnModel];
                }
                
                _hotNews = btnArr;
                ;
                // 刷新表格
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakself.tableView reloadData];
                    
                });
                
            }else{// 网络不通，提示不通
                NSLog(@"网络不通畅");
            }
        }];

    });
    // 结束刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [control endRefreshing];
    });
    
}

#pragma mark - <Banner数据源方法>
// 返回Banner需要显示Item(View)的个数
- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner
{
    return _banners.count;
    
}

// 返回Banner在不同的index所要显示的View
- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    ZSMDBanner *ban = _banners[index];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    NSURL *url = [NSURL URLWithString:ban.icon];
    [imageView sd_setImageWithURL:url];
    return imageView;
}



#pragma make - 数据刷新
// 进入界面，第一次刷新界面
- (void)firstSetupRefresh
{
    [self setupRefresh];
}

// 下拉刷新
- (void)setupRefresh
{
    //  下拉
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData:)];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
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
        return _hotNews.count;
    } else if (section == 5) {
        return 3;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {

            // 1.从缓存池中取ID表示的Cell
            static NSString *ID = @"bannerV";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            // 2.cell为空时，
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            
            [cell.contentView addSubview:self.bannerView];
            
            // 2.传入数据
            
            // 3.返回cell
            return cell;
            
        } else {                                 // 分类
        
            // 1.定义cell
            ZSMDClassifyCell *cell = [ZSMDClassifyCell cellWithTableView:tableView];
            // 2.传入数据
            cell.classify = _classify;
            
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
            cell.news = _hotNews[indexPath.row];
             
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
            cell.news = _hotNews[indexPath.row];
            
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
    
    return 0;
    
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
//    if (scrollView.contentOffset.y * 1.0 == 0) {
//        self.navigationController.navigationBar.alpha = 1;
//    }
//    self.navigationController.navigationBar.alpha = scrollView.contentOffset.y * 1.0 / 44;
//    NSLog(@"%f",self.navigationController.navigationBar.alpha);
}

@end
