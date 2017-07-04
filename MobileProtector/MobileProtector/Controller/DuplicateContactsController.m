//
//  DuplicateContactsController.m
//  MobileProtector
//
//  Created by KevinSu on 2017/7/4.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DuplicateContactsController.h"
#import "DuplicateContactsCell.h"

#define CELL_IDENTIFIER @"DuplicateContactsCell"

@interface DuplicateContactsController ()<UITableViewDelegate, UITableViewDataSource, DuplicateContactsCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* duplicateContacts;
@end

@implementation DuplicateContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.duplicateContacts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DuplicateContactsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    NSSet* contactsSet = self.duplicateContacts[indexPath.row];
    NSArray* contacts = contactsSet.allObjects;
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell initCellWithPersion1:contacts.firstObject person2:contacts.lastObject atIndexPath:indexPath];
    return cell;
}

#pragma mark - DuplicateContactsCellDelegate
- (void)ignoreAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.duplicateContacts];
    [mArray removeObjectAtIndex:indexPath.row];
    self.duplicateContacts = [mArray copy];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)combineAtIndexPath:(NSIndexPath *)indexPath {
    
}

+ (void)openByPush:(UINavigationController*)navVC contacts:(NSArray*)contacts {
    DuplicateContactsController* vc = ViewController(@"Main", @"DuplicateContactsController");
    vc.duplicateContacts = contacts;
    [navVC pushViewController:vc animated:YES];
}
@end
