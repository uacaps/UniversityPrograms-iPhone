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
@implementation MyUPInitTableViewCell
-(instancetype)init{
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MyUPInitTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}
-(void)buildWithEvent:(Event *)e{
    NSString *startDate = [e.startDate formattedDateWithFormat:@"MM/dd hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]];
    NSString *endDate = [e.endDate formattedDateWithFormat:@"MM/dd hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]];
    self.eventNameLabel.text=[NSString stringWithFormat:@"%@", e.eventName];
    self.numberAttending.text=[NSString stringWithFormat:@"Start: %@",startDate];
    self.dateLabel.text=[NSString stringWithFormat:@"End: %@",endDate];
    self.actualNumberAttending.text = [NSString stringWithFormat:@"%d attending", [e.numberAttending integerValue]];
    
    
    
    [self.image setImageWithURL:[NSURL URLWithString:e.imageUrl]];
    self.numberAttending.backgroundColor=[UIColor whiteColor];
    self.dateLabel.backgroundColor=[UIColor whiteColor];
    self.eventNameLabel.backgroundColor=[UIColor whiteColor];
    
    
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
