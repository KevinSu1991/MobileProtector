//
//  DeviceAnalyzeManager.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/20.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DeviceAnalyzeManager.h"

@implementation DeviceAnalyzeManager

+ (instancetype)sharedManager {
    static DeviceAnalyzeManager* sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DeviceAnalyzeManager alloc] init];
    });
    return sharedManager;
}

- (void)startAnalyze {
    
}
@end
