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
        self.icon = dict[@"icon"];
        self.icon1 = dict[@"icon1"];
        self.icon2 = dict[@"icon2"];
        self.icon3 = dict[@"icon3"];
        self.icon4 = dict[@"icon4"];
        self.icon5 = dict[@"icon5"];
        self.icon6 = dict[@"icon6"];
        self.icon7 = dict[@"icon7"];
    }
    return self;
    
}

+ (instancetype)classifyWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
