//
//  ZSMDClassifyView.h
//  掌上民大
//
//  Created by 王伟 on 16/3/14.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSMDClassify;

@interface ZSMDClassifyView : UIView

/** 模型数据 */
@property (nonatomic, strong) ZSMDClassify *classify;

+ (instancetype)classify;

@end
