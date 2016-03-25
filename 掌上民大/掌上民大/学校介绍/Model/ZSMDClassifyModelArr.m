//
//  ZSMDClassifyModelArr.m
//  掌上民大
//
//  Created by 王伟 on 16/3/20.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassifyModelArr.h"

@implementation ZSMDClassifyModelArr

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.icon = dict[@"icon"];
    }
    return self;
    
}

+ (instancetype)classifyModelArrWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
