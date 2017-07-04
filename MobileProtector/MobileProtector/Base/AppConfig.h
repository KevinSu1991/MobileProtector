//
//  AppConfig.h
//  MobileProtector
//
//  Created by KevinSu on 2017/6/20.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#ifdef MobileProtector_APP
#include "MobileProtectorAppConfig.h"
#else
//Do nothing
#endif

#define MAIN_CHECKER_DEVICE_ANALYZE                 @"Device Analyze"
#define MAIN_CHECKER_ADDRESSBOOK_OPTIMIZATION       @"Address Book Optimization"

#endif /* AppConfig_h */
