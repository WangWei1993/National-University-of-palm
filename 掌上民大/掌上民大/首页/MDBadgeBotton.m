//
//  MDBadgeBotton.m
//  西北民族大学
//
//  Created by wangwei on 15/7/28.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//

#import "MDBadgeBotton.h"
#import "UIImage+MDImage.h"

@implementation MDBadgeBotton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateSelected];
//        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.hidden = YES;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        [self setTitle:badgeValue forState:UIControlStateSelected];
        [self setTitle:badgeValue forState:UIControlStateNormal];

#warning sizeWithFont这个方法可能不能使用了  sizeWithFont:self.badgeButton.titleLabel.font
        //设置badButton的frame的宽高
        CGRect frame = self.frame;
        CGFloat badgeButtonW = self.currentBackgroundImage.size.width;
        CGFloat badgeButtonH = self.currentBackgroundImage.size.height;
        if (badgeValue.length > 1) {
            CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
            badgeButtonW = badgeSize.width + 10;
        }
        frame.size.width = badgeButtonW;
        frame.size.height = badgeButtonH;
        
        self.frame = frame;
        
    }else{
        self.hidden = YES;
    }
    

}


@end
