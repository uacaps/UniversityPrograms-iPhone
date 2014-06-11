//
//  AddressTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/9/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AddressTableViewCell.h"
#import "UIColor+UPColors.h"
@implementation AddressTableViewCell

-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AddressTableViewCell class]) owner:nil options:nil][0];
    self.findUsLabel.textColor = [UIColor getTextColor];
    self.address1Label.textColor = [UIColor getTextColor];
    self.address2Label.textColor = [UIColor getTextColor];
    self.address3Label.textColor = [UIColor getTextColor];
    self.address4Label.textColor = [UIColor getTextColor];
    self.teamLabel.textColor = [UIColor getTextColor];
    self.findUsLabel.backgroundColor = [UIColor getStyleColor];
    self.address1Label.backgroundColor = [UIColor getStyleColor];
    self.address2Label.backgroundColor = [UIColor getStyleColor];
    self.address3Label.backgroundColor = [UIColor getStyleColor];
    self.address4Label.backgroundColor = [UIColor getStyleColor];
    self.teamLabel.backgroundColor = [UIColor getStyleColor];
    self.backgroundColor = [UIColor getStyleColor];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
