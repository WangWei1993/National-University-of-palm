//
//  main.m
//  掌上民大
//
//  Created by 王伟 on 16/2/21.
//  Copyright © 2016年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *appKey = @"815b30f91d2e0cbb79b956ec7b434815";
        [Bmob registerWithAppKey:appKey];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
