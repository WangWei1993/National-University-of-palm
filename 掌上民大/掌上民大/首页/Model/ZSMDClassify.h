//
//  ZSMDClassify.h
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDClassify : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *icon;

/** 名字 */
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)classifyWithDict:(NSDictionary *)dict;

@end
