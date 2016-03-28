//
//  ZSMDLogoController.m
//  掌上民大
//
//  Created by 王伟 on 16/3/28.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDLogoController.h"

@interface ZSMDLogoController ()

@end

@implementation ZSMDLogoController

static ZSMDLogoController *_logoVC;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _logoVC = [super allocWithZone:zone];
    });
    return _logoVC;
}

+ (instancetype)sharedLogoVc
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _logoVC = [[self alloc] init];
    });
    return _logoVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



@end
