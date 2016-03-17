//
//  ZSMDHistory.h
//  掌上民大
//
//  Created by 王伟 on 16/3/15.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSMDHistory : NSObject

/** 时间 */
@property (nonatomic, copy) NSString *time;

/** 内容 */
@property (nonatomic, copy) NSString *contentText;

/** 图片数组 */
@property (nonatomic, strong) NSArray *arrImage;

/** 高度 */
@property (nonatomic, assign) CGFloat heightCell;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)historyWithDict:(NSDictionary *)dict;

@end
