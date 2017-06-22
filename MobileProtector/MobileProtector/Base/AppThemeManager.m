//
//  AppThemeManager.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "AppThemeManager.h"

@implementation AppThemeManager

+ (AppTheme*)currentTheme {
    return [AppThemeManager mobileProtectorTheme];
}

+ (AppTheme*)mobileProtectorTheme {
    AppTheme* appTheme = [[AppTheme alloc] init];
    appTheme.appColor = RGBACOLOR(86, 202, 139, 1);
    appTheme.appTextColor = [UIColor whiteColor];
    appTheme.appNavColor = appTheme.appColor;
    appTheme.appNavTextColor = [UIColor whiteColor];
    return appTheme;
}

@end

@implementation AppTheme
@end
