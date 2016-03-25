//
//  ZSMDClassify.h
//  掌上民大
//
//  Created by 王伟 on 16/3/12.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDClassify : NSObject

/** 图片0 */
@property (nonatomic, copy) NSString *icon;
/** 图片1 */
@property (nonatomic, copy) NSString *icon1;
/** 图片2 */
@property (nonatomic, copy) NSString *icon2;
/** 图片3 */
@property (nonatomic, copy) NSString *icon3;
/** 图片4 */
@property (nonatomic, copy) NSString *icon4;
/** 图片5 */
@property (nonatomic, copy) NSString *icon5;
/** 图片6 */
@property (nonatomic, copy) NSString *icon6;
/** 图片7 */
@property (nonatomic, copy) NSString *icon7;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)classifyWithDict:(NSDictionary *)dict;

@end
