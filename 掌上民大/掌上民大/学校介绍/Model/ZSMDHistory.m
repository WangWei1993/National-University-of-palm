//
//  ZSMDHistory.m
//  掌上民大
//
//  Created by 王伟 on 16/3/15.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDHistory.h"

@interface ZSMDHistory()


@end

@implementation ZSMDHistory

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.time = dict[@"time"];
        self.contentText = dict[@"contentText"];
        self.arrImage = dict[@"arrImage"];
    }
    return self;
    
}

+ (instancetype)historyWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
