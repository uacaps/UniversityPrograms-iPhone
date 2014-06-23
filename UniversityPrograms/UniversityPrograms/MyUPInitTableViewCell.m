//
//  MyUPInitTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/5/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "MyUPInitTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DateTools.h"
#import "UIColor+UPColors.h"
@implementation MyUPInitTableViewCell
-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MyUPInitTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}
-(void)buildWithEvent:(Event *)e{
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    NSString *startDate = [e.startDate formattedDateWithFormat:@"MMM dd, hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]];
    NSString *endDate = [e.endDate formattedDateWithFormat:@"MMM dd, hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]];
    self.eventNameLabel.text=[NSString stringWithFormat:@"%@", e.eventName];
    self.endDateLabel.text=[NSString stringWithFormat:@"Start: %@",startDate];
    self.startDateLabel.text=[NSString stringWithFormat:@"End: %@",endDate];
    self.actualNumberAttending.text = [NSString stringWithFormat:@"%ld Attending", (long)[e.numberAttending integerValue]];
    
    self.eventNameLabel.textColor = themeColor;
    self.eventNameLabel.textColor = themeColor;
    
    [self.image setImageWithURL:[NSURL URLWithString:e.imageUrl]];
    self.endDateLabel.backgroundColor=styleColor;
    self.startDateLabel.backgroundColor=styleColor;
    self.eventNameLabel.backgroundColor=styleColor;
    self.actualNumberAttending.backgroundColor = styleColor;
    self.backgroundColor = styleColor;
    
    self.actualNumberAttending.textColor = textColor;
    self.startDateLabel.textColor = textColor;
    self.endDateLabel.textColor = textColor;
  
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
