//
//  MainCheckerFooterView.h
//  MobileProtector
//
//  Created by KevinSu on 2017/6/21.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCheckerFooterView : UIView
@property (weak, nonatomic) IBOutlet UILabel *userMemoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *storageLabel;
@property (weak, nonatomic) IBOutlet UILabel *cpuLabel;

- (void)reload;
@end
