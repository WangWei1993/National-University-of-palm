//
//  ZSMDSection.m
//  掌上民大
//
//  Created by 王伟 on 16/3/14.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "ZSMDSection.h"

@interface ZSMDSection ()


@end

@implementation ZSMDSection
- (instancetype)initWithDict:(NSDictionary* )dict
{
    if (self = [super init]) {
        
        _title = dict[@"title"];
    }
    return self;
    
}

+ (instancetype)sectionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
