//
//  ZSMDHistoryController.m
//  掌上民大
//
//  Created by 王伟 on 16/3/15.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHistoryController.h"
#import "ZSMDHistoryContCell.h"
#import "ZSMDHistory.h"



@interface ZSMDHistoryController () <UITableViewDataSource ,UITableViewDelegate>

/** 数据模型 */
@property (nonatomic, strong) NSArray *arrHistory;

@end

@implementation ZSMDHistoryController

// 介绍数组-懒加载
- (void)loadNewData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"history" ofType:@"plist"];
    
    NSMutableArray *arr = [NSMutableArray array];
    NSArray *arrDic = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in arrDic) {
        ZSMDHistory *introduce = [ZSMDHistory historyWithDict:dic];
        [arr addObject:introduce];
    }
    self.arrHistory = arr;
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // tableView的背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:240.0/255 green:233.0/255.0 blue:226.0/255.0 alpha:1];
    
    // 分割线
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    // 已进入界面就下拉刷新
    [self loadMessages];
}

// 下拉刷新加载数据
- (void)loadMessages
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrHistory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSMDHistoryContCell *cell = [ZSMDHistoryContCell cellWithTableView:tableView];
    
    ZSMDHistory *history = self.arrHistory[indexPath.row];
    cell.history = history;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZSMDHistory *history = self.arrHistory[indexPath.row];
    return history.heightCell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


@end
