//
//  MyUPInitTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/5/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "MyUPInitTableViewCell.h"

@implementation MyUPInitTableViewCell
-(instancetype)init{
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MyUPInitTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}
-(void)build{
    self.firstNameLabel.text=[NSString stringWithFormat:@"First Name: %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"]];
    
    self.lastNameLabel.text=[NSString stringWithFormat:@"Last Name: %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"]];
    self.cwidLabel.text=[NSString stringWithFormat:@"CWID: %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"]];
    self.emailLabel.text=[NSString stringWithFormat:@"EMAIL: %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"email"]];
    self.myUPImage.image=[UIImage imageNamed:@"UP.jpg"];
    self.emailLabel.backgroundColor=[UIColor whiteColor];
    self.lastNameLabel.backgroundColor=[UIColor whiteColor];
    self.firstNameLabel.backgroundColor=[UIColor whiteColor];
    self.cwidLabel.backgroundColor=[UIColor whiteColor];
    
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
