//
//  ZSMDListen.h
//  掌上民大
//
//  Created by 王伟 on 16/3/22.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDListen : NSObject

/** icon */
@property (nonatomic, copy) NSString *icon;

/** 链接 */
@property (nonatomic, copy) NSString *link;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)listenWithDict:(NSDictionary *)dict;

@end
