
//
//  MDTabBarButton.m
//  西北民族大学
//
//  Created by wangwei on 15/7/27.
//  Copyright (c) 2015年 wangwei_IOS. All rights reserved.
//
#define MDTabBarButtonImage 0.5
#define IOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

////按钮的默认文字的颜色
#define MDTabBarButtonTitleColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//按钮选中文字的颜色
#define MDTabBarButtonTitleSelectedColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "MDTabBarButton.h"
#import "MDBadgeBotton.h"
#import "UIImage+MDImage.h"


@interface MDTabBarButton()

@property(nonatomic,weak)MDBadgeBotton *badgeButton;

@end

@implementation MDTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加标记的按钮
        MDBadgeBotton *badgeBtn = [[MDBadgeBotton alloc] init];
        [self addSubview:badgeBtn];
        self.badgeButton = badgeBtn;
        self.badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;

    
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self setTitleColor:MDTabBarButtonTitleColor(100, 100, 100) forState:UIControlStateNormal];
        [self setTitleColor:MDTabBarButtonTitleSelectedColor(41, 161, 255) forState:UIControlStateSelected];
    }

    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * MDTabBarButtonImage;
    
    return CGRectMake(0, 3, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * MDTabBarButtonImage;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * MDTabBarButtonImage;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted
{
}


- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    //标记按钮的内容

    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
//    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
//    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
//    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
}

//使用KVO要释放内存
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
//    [self.item removeObserver:self forKeyPath:@"title"];
//    [self.item removeObserver:self forKeyPath:@"image"];
//    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
//    if (self.item.badgeValue) {
//        self.badgeButton.hidden = NO;
//        [self.badgeButton setTitle:self.item.badgeValue forState:UIControlStateSelected];
//        [self.badgeButton setTitle:self.item.badgeValue forState:UIControlStateNormal];
//        self.badgeButton.titleLabel.font = [UIFont systemFontOfSize:11];
//        
//        //设置badgeButton的尺寸
//        
//#warning sizeWithFont这个方法可能不能使用了  sizeWithFont:self.badgeButton.titleLabel.font
//        //设置badButton的frame
//        CGFloat badgeButtonW = self.badgeButton.currentBackgroundImage.size.width;
//        CGFloat badgeButtonH = self.badgeButton.currentBackgroundImage.size.height;
//        if (self.item.badgeValue.length > 1) {
//            CGSize badgeSize = [self.item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
//            badgeButtonW = badgeSize.width + 10;
//        }
//        CGFloat badgeButtonX = self.frame.size.width - badgeButtonW -18;
//        CGFloat badgeButtonY = 5;
//        self.badgeButton.frame = CGRectMake(badgeButtonX, badgeButtonY, badgeButtonW, badgeButtonH);
//        
//        NSLog(@"11");
//        
//    }else{
//        self.badgeButton.hidden = YES;
//    }
    
    
    //给提醒按钮赋值
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    //设置提示数字的位置
    CGFloat badgeButtonX = self.frame.size.width - self.badgeButton.frame.size.width-10;
    CGFloat badgeButtonY = 5;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeButtonX;
    badgeF.origin.y = badgeButtonY;
    self.badgeButton.frame = badgeF;
    

}

@end
