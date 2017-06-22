//
//  ViewControllerUtils.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "ViewControllerUtils.h"
#import "AppDelegate.h"
#import "RootNavViewController.h"

@implementation ViewControllerUtils

+ (UIBarButtonItem*)createNavigationBackButton {
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:[self class] action:@selector(backAction)];
    return backItem;
}

+ (void)backAction {
    UIViewController* rootVC = ((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
    if ([rootVC isKindOfClass:[RootNavViewController class]]) {
        [((RootNavViewController*)rootVC) popViewControllerAnimated:YES];
    }
}

@end
