//
//  ZSMDIntroduce.m
//  掌上民大
//
//  Created by 王伟 on 16/3/9.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDIntroduce.h"

@implementation ZSMDIntroduce

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        _title = dict[@"title"];
        _detialTitle = dict[@"detialTitle"];
    }
    return self;
    
}

+ (instancetype)introduceWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
