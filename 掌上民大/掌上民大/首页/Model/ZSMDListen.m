//
//  ZSMDListen.m
//  掌上民大
//
//  Created by 王伟 on 16/3/22.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDListen.h"

@implementation ZSMDListen

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.link = dict[@"link"];
        self.icon = dict[@"icon"];
    }
    return self;
    
}

+ (instancetype)listenWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
