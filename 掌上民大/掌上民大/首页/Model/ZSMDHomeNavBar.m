//
//  ZSMDHomeNavBar.m
//  掌上民大
//
//  Created by 王伟 on 16/3/11.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHomeNavBar.h"

@implementation ZSMDHomeNavBar

+ (instancetype)homeNavBar
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZSMDHomeNavBar.plist" owner:nil options:nil] lastObject];
}

@end
