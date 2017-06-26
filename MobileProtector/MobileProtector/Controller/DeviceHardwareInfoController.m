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
@property (nonatomic, strong) DeviceHarewareHeaderView* headerView;
@end

@implementation DeviceHardwareInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [ViewControllerUtils createNavigationBackButton];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"DeviceHarewareHeaderView" owner:self options:nil] lastObject];
    self.headerView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 120);
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 3;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
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
            }
            break;
        }
        case 2:
        {
            if (row == 0) {
                //Cpu Type
                title = NSLocalizedString(@"CPU Type", nil);
                detialInfo = [DeviceManager getCPUType];
            } else if (row == 1) {
                
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
