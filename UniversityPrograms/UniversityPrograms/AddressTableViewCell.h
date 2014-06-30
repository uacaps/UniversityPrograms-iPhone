//
//  AddressTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/9/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactUPViewController.h"
static const NSInteger AddressTableViewCellHeight = 160;

@interface AddressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *findUsLabel;
@property (weak, nonatomic) IBOutlet UILabel *address1Label;
@property (weak, nonatomic) IBOutlet UILabel *address2Label;
@property (weak, nonatomic) IBOutlet UILabel *address3Label;
@property (weak, nonatomic) IBOutlet UILabel *address4Label;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (weak, nonatomic) IBOutlet UIButton *addressButton;
@property ContactUPViewController *owner;

-(void)build;


@end
