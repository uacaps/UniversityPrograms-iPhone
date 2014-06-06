//
//  DirectoryTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "DirectoryTableViewCell.h"
#import "UIImageView+WebCache.h"
@import QuartzCore;

@implementation DirectoryTableViewCell
-(instancetype)init{
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DirectoryTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}
-(void)buildWtihEmployee:(Employee *)emp{
    self.employeeEmail.text=emp.email;
    //self.employeeImage.layer.cornerRadius=2;
    [self.employeeImage setImageWithURL:[[NSURL alloc] initWithString:emp.imageURL]];
    self.employeeName.text=emp.name;
    self.employeePhone.text=emp.phone;
    self.employeeTitle.text=emp.title;
    self.employeeImage.layer.cornerRadius=8;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
