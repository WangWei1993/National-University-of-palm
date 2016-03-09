//
//  ZSMDIntroduce.h
//  掌上民大
//
//  Created by 王伟 on 16/3/9.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSMDIntroduce : UIButton

/** 题目 */
@property (nonatomic, copy) NSString *title;

/** 小标题 */
@property (nonatomic, copy) NSString *detialTitle;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)introduceWithDict:(NSDictionary *)dict;

@end
