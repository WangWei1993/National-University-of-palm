//
//  WWButtonModel.m
//  掌上民大
//
//  Created by 王伟 on 16/3/18.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "WWButtonModel.h"

@implementation WWButtonModel

- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
    
}

+ (instancetype)buttonModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
