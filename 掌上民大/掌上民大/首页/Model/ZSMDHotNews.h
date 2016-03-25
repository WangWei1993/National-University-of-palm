//
//  ZSMDHotNews.h
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDHotNews : NSObject

/** title */
@property (nonatomic, copy) NSString *title;

/** detial */
@property (nonatomic, copy) NSString *detial;

/** icon */
@property (nonatomic, copy) NSString *icon;



- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)hotNewsWithDict:(NSDictionary *)dict;

@end
