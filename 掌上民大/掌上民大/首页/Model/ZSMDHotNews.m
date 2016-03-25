//
//  ZSMDHotNews.m
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHotNews.h"

@implementation ZSMDHotNews

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.detial = dict[@"detial"];
        self.icon = dict[@"icon"];
    }
    return self;
    
}

+ (instancetype)hotNewsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
