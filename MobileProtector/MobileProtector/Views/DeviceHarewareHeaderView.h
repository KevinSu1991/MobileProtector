//
//  DeviceHarewareHeaderView.h
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceHarewareHeaderView : UIView
@property (nonatomic, weak) IBOutlet UILabel* deviceTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel* deviceSysVersionLabel;
@property (nonatomic, weak) IBOutlet UILabel* deviceNameLabel;

- (void)loadBaseUI;
@end
