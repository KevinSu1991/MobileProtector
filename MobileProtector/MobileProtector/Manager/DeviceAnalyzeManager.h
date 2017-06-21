//
//  DeviceAnalyzeManager.h
//  MobileProtector
//
//  Created by KevinSu on 2017/6/20.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AnalyzeItem_Device_Info     @"DeviceInfo"

@interface DeviceAnalyzeManager : NSObject
@property (nonatomic, strong) NSArray* analyzeItems;

+ (instancetype)sharedManager;

- (void)startAnalyze;
@end
