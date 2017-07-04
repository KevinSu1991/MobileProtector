//
//  DuplicateContactsCell.h
//  MobileProtector
//
//  Created by KevinSu on 2017/7/4.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsService.h"

@protocol DuplicateContactsCellDelegate <NSObject>

- (void)ignoreAtIndexPath:(NSIndexPath*)indexPath;

- (void)combineAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface DuplicateContactsCell : UITableViewCell
@property (nonatomic) id<DuplicateContactsCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *contact1LetterLabel;
@property (weak, nonatomic) IBOutlet UILabel *contact1NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contact1PhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *contact2LetterLabel;
@property (weak, nonatomic) IBOutlet UILabel *contact2NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contact2PhoneLabel;

@property (weak, nonatomic) IBOutlet UIButton *ignoreButton;
@property (weak, nonatomic) IBOutlet UIButton *combineButton;

- (void)initCellWithPersion1:(IABPerson*)person1 person2:(IABPerson*)person2 atIndexPath:(NSIndexPath*)indexPath;
@end
