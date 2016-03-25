//
//  WWButtonModel.h
//  掌上民大
//
//  Created by 王伟 on 16/3/18.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWButtonModel : NSObject

/** name */
@property (nonatomic, copy) NSString *name;

/** icon */
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)buttonModelWithDict:(NSDictionary *)dict;

@end
