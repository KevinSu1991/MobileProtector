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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
