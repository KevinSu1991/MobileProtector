//
//  MainCheckerController.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/20.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "MainCheckerController.h"
#import "VWWWaterView.h"
#import "MainCheckerHeaderView.h"

@interface MainCheckerController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MainCheckerHeaderView* headerView;
@end

static NSString* CELLIDENTIFIER = @"MainCheckerCell";
@implementation MainCheckerController {
    NSArray* dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
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
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.separatorColor = [UIColor lightGrayColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self initTableHeaderView];
}

- (void)initTableHeaderView {
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MainCheckerHeaderView" owner:self options:nil] lastObject];
    self.headerView.backgroundColor = [UIColor blueColor];
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);
    self.headerView.backgroundColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    VWWWaterView* waterView = [[VWWWaterView alloc] initWithFrame:self.headerView.frame];
    [self.headerView addSubview:waterView];
    self.tableView.tableHeaderView = self.headerView;
    [self.headerView refreshHeader];
}

- (void)initData {
    dataSource = @[
                   MAIN_CHECKER_DEVICE_ANALYZE,
                   MAIN_CHECKER_QUICK_SCAN
                   ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLIDENTIFIER];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString* title = dataSource[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}
@end
