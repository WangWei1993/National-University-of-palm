//
//  UIImage+MDImage.m
//  西北民族大学
//
//  Created by wangwei on 15/7/25.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//

//判断是否为IOS7

#import "UIImage+MDImage.h"
#define IOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7.0
@implementation UIImage (MDImage)

+ (UIImage *)imageWithName:(NSString *)imageName
{
    if (IOS7) {
        NSString *newImageName = [imageName stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newImageName];
        
        if (newImageName == nil) {
            newImageName = imageName;
        }
        return image;
    }
    
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

@end
