//
//  AppThemeManager.h
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppTheme : NSObject
@property (nonatomic, strong) UIColor* appColor;
@property (nonatomic, strong) UIColor* appTextColor;
@property (nonatomic, strong) UIColor* appNavColor;
@property (nonatomic, strong) UIColor* appNavTextColor;
@end

@interface AppThemeManager : NSObject

+ (AppTheme*)currentTheme;

+ (AppTheme*)mobileProtectorTheme;
@end
