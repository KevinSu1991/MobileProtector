//
//  DeviceHardwareInfoController.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/22.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DeviceHardwareInfoController.h"
#import "DeviceHarewareHeaderView.h"

#define CELL_IDENTIFIER @"DeviceInfoCell"

#define TITLE_BASE_INFO         @"Base Info"
#define TITLE_NETWORK_INFO      @"Network Info"

@interface DeviceHardwareInfoController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet DeviceHarewareHeaderView* headerView;
@end

@implementation DeviceHardwareInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.headerView loadBaseUI];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 16;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return NSLocalizedString(@"Basic Info", nil);
    } else if (section == 1) {
        return NSLocalizedString(@"Network Info", nil);
    } else if (section == 2) {
        return NSLocalizedString(@"Hardware Info", nil);
    }
    return @"";
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL_IDENTIFIER];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSString* title;
    NSString* detialInfo;
    switch (section) {
        case 0:
        {
            if (row == 0) {
                //Last Boot time
                title = NSLocalizedString(@"Last Boot Time", nil);
                detialInfo = [DeviceManager getUpTime];
            } else if (row == 1) {
                //Running time
                title = NSLocalizedString(@"Running Time", nil);
                detialInfo = [DeviceManager getRunningTime];
            }
            break;
        }
        case 1:
        {
            if (row == 0) {
                //IP
                title = NSLocalizedString(@"IP", nil);
                detialInfo = [AppUtils getIPAddress];
            } else if (row == 1) {
                //Network Type
                title = NSLocalizedString(@"Network Type", nil);
                detialInfo = [AppUtils networkString];
            } else if (row == 2) {
                //Mac Address
                title = NSLocalizedString(@"Mac Address", nil);
                detialInfo = [UIDevice currentDevice].macaddress;
            }
            break;
        }
        case 2:
        {
            if (row == 0) {
                title = NSLocalizedString(@"Cpu", nil);
                detialInfo = [DeviceManager getCPUType];
            } else if (row == 1) {
                title = NSLocalizedString(@"Cpu Cores", nil);
                detialInfo = [DeviceManager getCpuCores];
            } else if (row == 2) {
                title = NSLocalizedString(@"Cpu Arch", nil);
                detialInfo = [DeviceManager getCpuArch];
            } else if (row == 3) {
                title = NSLocalizedString(@"Cpu Clock", nil);
                detialInfo = [DeviceManager getCpuClock];
            } else if (row == 4) {
                title = NSLocalizedString(@"Gpu", nil);
                detialInfo = [DeviceManager getGpu];
            } else if (row == 5) {
                title = NSLocalizedString(@"Gpu Cores", nil);
                detialInfo = [DeviceManager getGpuCores];
            } else if (row == 6) {
                title = NSLocalizedString(@"Gpu Clock", nil);
                detialInfo = [DeviceManager getGpuClock];
            } else if (row == 7) {
                title = NSLocalizedString(@"Ram", nil);
                detialInfo = [DeviceManager getRAM];
            } else if (row == 8) {
                title = NSLocalizedString(@"Mem", nil);
                detialInfo = [DeviceManager memType];
            } else if (row == 9) {
                title = NSLocalizedString(@"Mem Speed", nil);
                detialInfo = [DeviceManager memSpeed];
            } else if (row == 10) {
                title = NSLocalizedString(@"Screen Res", nil);
                detialInfo = [DeviceManager screenRes];
            } else if (row == 11) {
                title = NSLocalizedString(@"Screen Size", nil);
                detialInfo = [DeviceManager screenSize];
            } else if (row == 12) {
                title = NSLocalizedString(@"Lastest OS Version", nil);
                detialInfo = [DeviceManager lastestOSver];
            } else if (row == 13) {
                title = NSLocalizedString(@"Motion Coprocessor", nil);
                detialInfo = [DeviceManager motionCoprocessor];
            } else if (row == 14) {
                title = NSLocalizedString(@"SoC", nil);
                detialInfo = [DeviceManager soc];
            } else if (row == 15) {
                title = NSLocalizedString(@"Year", nil);
                detialInfo = [DeviceManager year];
            }
            break;
        }
        default:
            break;
    }
    cell.detailTextLabel.text = detialInfo;
    cell.textLabel.text = title;
    return cell;
}

@end
