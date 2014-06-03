//
//  upcomingEventsTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "upcomingEventsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Colours.h"
@implementation upcomingEventsTableViewCell

-(instancetype)init{
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([upcomingEventsTableViewCell class]) owner:nil options:nil][0];
    self.backgroundColor= [UIColor creamColor];
    NSURL *url = [NSURL URLWithString:@"http://wow.ua.edu/images/WOWlogo2014.png"];
    [self.eventImage setImageWithURL:url];
    self.eventImage.backgroundColor=[UIColor creamColor];
    
    return self;
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
