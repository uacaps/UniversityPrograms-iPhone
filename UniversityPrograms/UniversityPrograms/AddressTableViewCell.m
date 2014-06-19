//
//  AddressTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/9/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AddressTableViewCell.h"
#import "UIColor+UPColors.h"
#import "ContactUPMapViewController.h"
@import QuartzCore;
@implementation AddressTableViewCell

-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AddressTableViewCell class]) owner:nil options:nil][0];
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    self.findUsLabel.textColor = themeColor;
    self.address1Label.textColor = textColor;
    self.address2Label.textColor = textColor;
    self.address3Label.textColor = textColor;
    self.address4Label.textColor = textColor;
    self.teamLabel.textColor = themeColor;
    self.findUsLabel.backgroundColor = styleColor;
    self.address1Label.backgroundColor = styleColor;
    self.address2Label.backgroundColor = styleColor;
    self.address3Label.backgroundColor = styleColor;
    self.address4Label.backgroundColor = styleColor;
    self.teamLabel.backgroundColor = styleColor;
    self.addressButton.backgroundColor = themeColor;
    self.addressButton.tintColor = styleColor;
    self.addressButton.layer.cornerRadius = 12;
    self.backgroundColor = styleColor;
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapAddress:(id)sender {
    ContactUPMapViewController *mapController = [[ContactUPMapViewController alloc] init];
    [self.owner.navigationController pushViewController:mapController animated:YES];
    //[self.owner.navigationController presentViewController:mapController animated:YES completion:^{
        
    //}];
    //NSURL *mapURL = [NSURL URLWithString:@"http://maps.apple.com/?q=700+University+Boulevard+Tuscaloosa,+AL+35487"];
    //[[UIApplication sharedApplication] openURL:mapURL];
}

@end
