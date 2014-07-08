//
//  FollowUPTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "FollowUPTableViewCell.h"
#import "UIColor+UPColors.h"
#import "UIImage+UPImage.h"
@import QuartzCore;

@implementation FollowUPTableViewCell
-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FollowUPTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}
-(void)build{
    self.backgroundColor = [UIColor getStyleColor];
    self.mainTwitterLabel.backgroundColor=[UIColor getStyleColor];
    self.followUPLabel.textColor = [UIColor getThemeColor];
    self.followUPLabel.backgroundColor = [UIColor getStyleColor];
    self.mainTwitterLabel.backgroundColor = [UIColor getStyleColor];
    self.mainTwitterLabel.textColor = [UIColor getTextColor];
    self.mainFacebookLabel.backgroundColor = [UIColor getStyleColor];
    self.mainFacebookLabel.textColor = [UIColor getTextColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.facebookImage.image = [[UIImage imageNamed:@"Facebook_filled"] imageWithColor:[UIColor facebookBlue]];
    self.twitterImage.image = [[UIImage imageNamed:@"Twitter_filled"]imageWithColor:[UIColor twitterBlue]];
    self.facebookImage.layer.cornerRadius = self.facebookImage.frame.size.height/2;
    self.facebookImage.backgroundColor = [UIColor whiteColor];
    self.twitterImage.layer.cornerRadius = self.twitterImage.frame.size.height/2;
    self.twitterImage.backgroundColor = [UIColor whiteColor];
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
- (IBAction)didTapMainTwitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=UAwhatsUP"]];
}
- (IBAction)didTapMainFacebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/633116520086429"]];
    
}

@end
