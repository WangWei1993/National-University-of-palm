//
//  ZSMDButton.h
//  掌上民大
//
//  Created by 王伟 on 16/3/9.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSMDButton;
@class ZSMDIntroduce;

@protocol ZSMDIntroduceDelegate <NSObject>

@optional
- (void)pushViewController:(ZSMDButton *)btn;

@end

@interface ZSMDButton : UIButton

/** ZSMD按钮协议 */
@property (nonatomic, weak) id<ZSMDIntroduceDelegate> delegate;

/** 模型数据 */
@property (nonatomic, strong) ZSMDIntroduce *intriduce;

+ (instancetype)button;

@end
