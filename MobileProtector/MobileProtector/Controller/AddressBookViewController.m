//
//  AddressBookViewController.m
//  MobileProtector
//
//  Created by KevinSu on 2017/6/29.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "AddressBookViewController.h"
#import "ContactsService.h"
#import "DuplicateContactsController.h"

@interface AddressBookViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contactsInfoLabel;
@property (weak, nonatomic) IBOutlet UIView *duplicateContactsContainer;
@property (weak, nonatomic) IBOutlet UILabel *duplicateContactsLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *duplicateContactsProgressView;
@property (weak, nonatomic) IBOutlet UIButton *duplicateContactsClear;
@property (weak, nonatomic) IBOutlet UIView *incompleteContactsContainer;
@property (weak, nonatomic) IBOutlet UILabel *incompleteContactsLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *incompleteContactsProgressView;
@property (weak, nonatomic) IBOutlet UIButton *incompleteContactsClear;

@property (nonatomic, strong) NSMutableArray* contactsArr;

@property (nonatomic, strong) NSMutableArray* duplicateContacts;
@property (nonatomic, strong) NSMutableArray* incompleteContacts;
@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBACOLOR(241, 241, 241, 1);
    self.duplicateContactsContainer.hidden = YES;
    self.incompleteContactsContainer.hidden = YES;
    self.contactsArr = [NSMutableArray array];
    [self checkContact];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkContact {
    self.contactsInfoLabel.text = NSLocalizedString(@"Reading contacts...", nil);
    if ([ContactsService authorize]) {
        NSDictionary* contactsDict = [ContactsService loadContacts];
        for (NSString* key in contactsDict.allKeys) {
            NSArray* persons = contactsDict[key];
            [self.contactsArr addObjectsFromArray:persons];
        }
        [self updateUI];
        [self checkDuplicateContacts];
        [self checkIncompleteContacts];
    } else {
        self.contactsInfoLabel.text = NSLocalizedString(@"Reading contacts failed", nil);
    }
}

- (void)checkDuplicateContacts {
    self.duplicateContactsContainer.hidden = NO;
    self.duplicateContactsClear.hidden = YES;
    self.duplicateContactsProgressView.hidden = NO;
    self.duplicateContacts = [NSMutableArray array];
    for (IABPerson* person1 in self.contactsArr) {
        NSMutableSet* mSet = [NSMutableSet set];
        for (IABPerson* person2 in self.contactsArr) {
            if (![person1 isEqual:person2] && [person1 compare:person2]) {
                [mSet addObject:person1];
                [mSet addObject:person2];
            }
        }
        if (mSet.count > 0 && ![self set:mSet inArray:self.duplicateContacts]) {
            [self.duplicateContacts addObject:mSet];
        }
    }
    self.duplicateContactsClear.hidden = NO;
    self.duplicateContactsProgressView.hidden = YES;
    
    self.duplicateContactsLabel.text = [NSString stringWithFormat:@"%li %@", (long)self.duplicateContacts.count, NSLocalizedString(@"duplicate contacts", nil)];
}

- (BOOL)set:(NSSet*)set inArray:(NSArray*)array {
    for (NSSet* aSet in array) {
        if ([aSet isEqual:set]) {
            return YES;
        }
    }
    return NO;
}

- (void)checkIncompleteContacts {
    self.incompleteContactsContainer.hidden = NO;
    self.incompleteContactsClear.hidden = YES;
    self.incompleteContactsProgressView.hidden = NO;
    self.incompleteContacts = [NSMutableArray array];
    for (IABPerson* person in self.contactsArr) {
        if ([[person.FirstName lowercaseString] isEqualToString:@"kevinsu"] ||
            [[person.LastName lowercaseString] isEqualToString:@"kevinsu"] ) {
            DLog(@"");
        }
        if (person.MobilePhone.length == 0 &&
            person.HomeTel.length == 0 &&
            person.WorkTel.length == 0 &&
            person.OtherTel.length == 0 &&
            person.Email.length == 0) {
            [self.incompleteContacts addObject:person];
        }
    }
    self.incompleteContactsClear.hidden = NO;
    self.incompleteContactsProgressView.hidden = YES;
    
    self.incompleteContactsLabel.text = [NSString stringWithFormat:@"%li %@", (long)self.incompleteContacts.count, NSLocalizedString(@"incomplete contacts", nil)];
}

- (void)updateUI {
    NSInteger count = self.contactsArr.count;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.contactsInfoLabel.text = [NSString stringWithFormat:@"%li%@", (long)count, NSLocalizedString(@"contacts", nil)];
    });
}

- (IBAction)showDuplicateContacts:(id)sender {
    [DuplicateContactsController openByPush:self.navigationController contacts:_duplicateContacts];
}

- (IBAction)showIncomplatedContacts:(id)sender {
    
}

+ (void)openByPush:(UINavigationController*)navVC {
    AddressBookViewController* vc = ViewController(@"Main", @"AddressBookViewController");
    [navVC pushViewController:vc animated:YES];
}

@end
