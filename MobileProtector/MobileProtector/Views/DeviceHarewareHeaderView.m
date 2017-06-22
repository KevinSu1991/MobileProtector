//
//  DeviceHarewareHeaderView.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DeviceHarewareHeaderView.h"

@implementation DeviceHarewareHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.deviceTypeLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.deviceSysVersionLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.deviceNameLabel.textColor = [AppThemeManager currentTheme].appTextColor;
    self.backgroundColor = [AppThemeManager currentTheme].appColor;
}

@end
