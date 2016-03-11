//
//  ViewController.m
//  CYVideoPlayer
//
//  Created by dongzb on 16/2/20.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import "AVViewController.h"
#import "CYVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "CYFullViewController.h"
 NSString *play_url = @"http://7xnujb.com2.z0.glb.qiniucdn.com/%E5%A4%8F%E8%87%B3%E6%9C%AA%E8%87%B301/001.mp4";

@interface AVViewController ()<CYVideoPlayerDelegate>

/** 关闭按钮 */
@property (nonatomic, weak) UIButton *closeBtn;

@property (nonatomic,strong) CYVideoPlayerView *playerView;

@property (nonatomic,strong) CYFullViewController *fullViewController;
@end

@implementation AVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 返回按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.closeBtn = closeBtn;
    [self.view addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.right.bottom.mas_equalTo(self.view);
    }];
    [closeBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.playerView = [[CYVideoPlayerView alloc] init];
    self.playerView.delegate = self;
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(self.view.bounds.size.width * 9 / 16);
    }];
    self.navigationController.navigationBarHidden = YES;
    // 传一个 AVPlayerItem 如果能够播放视频就会调用play方法
    [self.playerView replaceAVPlayerItem:[[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:play_url]]];
    
}

- (void)closeView
{
    [self.playerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CYVideoPlayerDelegate
/** <是否全屏播放视频> */
- (void)cyVideoToolBarView:(CYVideoToolBar *)cyVideoToolBar shouldFullScreen:(BOOL)isFull
{
    if (isFull) {
        self.fullViewController = [[CYFullViewController alloc] init];
        [self.fullViewController.view addSubview:self.playerView];
        [self.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.removeExisting = YES;
        }];
        [self.playerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.fullViewController.view);
        }];
        [self presentViewController:self.fullViewController animated:NO completion:nil];
    }else
    {
        [self.fullViewController dismissViewControllerAnimated:NO completion:^{
            [self.view addSubview:self.playerView];
            self.fullViewController = nil;
            [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.view);
                make.right.mas_equalTo(self.view);
                make.centerY.mas_equalTo(self.view.mas_centerY);
                make.height.mas_equalTo(self.view.bounds.size.width * 9 / 16);
            }];
        }];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
