//
//  MainCheckerHeaderView.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/20.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "MainCheckerHeaderView.h"
#import <UICountingLabel/UICountingLabel.h>

@interface MainCheckerHeaderView()
@property (weak, nonatomic) IBOutlet UICountingLabel *rewardsLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *storageLabel;
@property (weak, nonatomic) IBOutlet UIButton *analyzeButton;
@property (weak, nonatomic) IBOutlet UIView *analyzeMaskView;
@end

@implementation MainCheckerHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.analyzeButton.layer.cornerRadius = 15.f;
    self.analyzeButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.analyzeButton.layer.borderWidth = 1.f;
    self.analyzeMaskView.layer.cornerRadius = 15.f;
    
    [self.rewardsLabel setFormat:@"%d"];
    [self.rewardsLabel countFrom:100 to:0];
}

- (void)refreshHeader {
    self.deviceInfoLabel.text = [NSString stringWithFormat:@"%@", [UIDevice currentDevice].platformString];
    self.storageLabel.text = [NSString stringWithFormat:@"%@:%.1fGB", NSLocalizedString(@"Available Storage", nil), [[[UIDevice currentDevice] freeDiskSpace] integerValue]/(1000*1000*1000.0)];
}
@end
