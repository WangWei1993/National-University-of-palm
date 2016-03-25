//
//  WWButton.m
//  掌上民大
//
//  Created by 王伟 on 16/3/18.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import "WWButton.h"
#import "WWButtonModel.h"

#define ratio 0.4

@implementation WWButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

// 自定义布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;
    
   
    self.imageView.frame = CGRectMake((buttonW - buttonH * ratio) * 0.5 , (buttonW - buttonH * ratio) * 0.2, buttonH * ratio, buttonH * ratio);
    self.titleLabel.frame = CGRectMake(0,self.imageView.frame.size.height , self.frame.size.width, buttonH - buttonH * ratio);
    

    [self setTitleColor:[UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    // 设置字体
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS" size:13]];
}

@end
