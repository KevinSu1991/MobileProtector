//
//  DuplicateContactsCell.m
//  MobileProtector
//
//  Created by KevinSu on 2017/7/4.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

#import "DuplicateContactsCell.h"

@implementation DuplicateContactsCell {
    NSIndexPath* curIndexPath;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initCellWithPersion1:(IABPerson*)person1 person2:(IABPerson*)person2 atIndexPath:(NSIndexPath*)indexPath {
    curIndexPath = indexPath;
    
    NSString* name1 = [NSString stringWithFormat:@"%@%@", person1.LastName, person1.FirstName];
    NSString* letter1 = @"";
    if (name1.length > 0) {
        letter1 = [name1 substringWithRange:NSMakeRange(0, 1)];
    }
    self.contact1LetterLabel.text = letter1;
    self.contact1NameLabel.text = name1;
    self.contact1PhoneLabel.text = person1.MobilePhone;
    
    NSString* name2 = [NSString stringWithFormat:@"%@%@", person2.LastName, person2.FirstName];
    NSString* letter2 = @"";
    if (name2.length > 0) {
        letter2 = [name2 substringWithRange:NSMakeRange(0, 1)];
    }
    self.contact2LetterLabel.text = letter2;
    self.contact2NameLabel.text = name2;
    self.contact2PhoneLabel.text = person2.MobilePhone;
}
- (IBAction)ignoreAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ignoreAtIndexPath:)]) {
        [self.delegate ignoreAtIndexPath:curIndexPath];
    }
}

- (IBAction)combineAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(combineAtIndexPath:)]) {
        [self.delegate combineAtIndexPath:curIndexPath];
    }
}

@end
