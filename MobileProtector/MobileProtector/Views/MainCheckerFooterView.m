//
//  MainCheckerFooterView.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/21.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "MainCheckerFooterView.h"

@implementation MainCheckerFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)reload {
    double totalMemory = [UIDevice currentDevice].totalMemory;
    double userMemory = [UIDevice currentDevice].userMemory;
    self.userMemoryLabel.text = [NSString stringWithFormat:@"%.0f%%", (userMemory / (totalMemory * 1.0))*100];
    
    double totalStorage = [[UIDevice currentDevice].totalDiskSpace integerValue];
    double freeStorage = [[UIDevice currentDevice].freeDiskSpace integerValue];
    self.storageLabel.text = [NSString stringWithFormat:@"%.0f%%", (freeStorage / (totalStorage * 1.0))*100];
    
    self.cpuLabel.text = [NSString stringWithFormat:@"%.0f%%", [[DeviceManager sharedManager] getCPUUsagePercentage]*100];
}

@end
