//
//  RootNavViewController.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "RootNavViewController.h"

@interface RootNavViewController ()

@end

@implementation RootNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIBarButtonItem appearance] setTintColor:[AppThemeManager currentTheme].appNavTextColor];
    [UINavigationBar appearance].barTintColor = [AppThemeManager currentTheme].appNavColor;
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[AppThemeManager currentTheme].appNavTextColor
                                                           }];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
