//
//  DeviceHarewareHeaderView.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DeviceHarewareHeaderView.h"

@implementation DeviceHarewareHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.deviceTypeLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.deviceSysVersionLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.deviceNameLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.backgroundColor = [AppThemeManager currentTheme].appColor;
    
    self.deviceTypeLabel.text = [UIDevice currentDevice].platformString;
    self.deviceSysVersionLabel.text = [NSString stringWithFormat:@"%@ : %@", NSLocalizedString(@"System Version", nil), [UIDevice currentDevice].systemVersion];
    self.deviceNameLabel.text = [NSString stringWithFormat:@"%@ : %@", NSLocalizedString(@"Device Name", nil), [UIDevice currentDevice].name];
}

@end
