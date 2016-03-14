//
//  ZSMDSection.h
//  掌上民大
//
//  Created by 王伟 on 16/3/14.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSMDSection : NSObject

/** title */
@property (nonatomic, copy) NSString *title;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)sectionWithDict:(NSDictionary *)dict;

@end
