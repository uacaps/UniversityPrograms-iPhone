//
//  FollowUPTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "FollowUPTableViewCell.h"
#import "UIColor+UPColors.h"
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
