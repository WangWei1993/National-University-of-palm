//
//  ZSMDBanner.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDBanner.h"

@implementation ZSMDBanner

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.icon = dict[@"icon"];
    }
    return self;
    
}

+ (instancetype)bannerWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
