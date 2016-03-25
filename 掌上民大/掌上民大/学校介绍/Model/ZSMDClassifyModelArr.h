//
//  ZSMDClassifyModelArr.h
//  掌上民大
//
//  Created by 王伟 on 16/3/20.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDClassifyModelArr : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)classifyModelArrWithDict:(NSDictionary *)dict;

@end
