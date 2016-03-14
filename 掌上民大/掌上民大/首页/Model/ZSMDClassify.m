//
//  ZSMDClassify.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDClassify.h"

@implementation ZSMDClassify

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        //字典转模型
    }
    return self;
    
}

+ (instancetype)classifyWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
