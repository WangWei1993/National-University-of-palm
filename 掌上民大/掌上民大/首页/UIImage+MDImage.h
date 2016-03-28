//
//  UIImage+MDImage.h
//  西北民族大学
//
//  Created by wangwei on 15/7/25.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MDImage)
+ (UIImage *)imageWithName:(NSString *)imageName;

+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
