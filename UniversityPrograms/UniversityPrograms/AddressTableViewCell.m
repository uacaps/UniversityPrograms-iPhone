//
//  AddressTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/9/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AddressTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
