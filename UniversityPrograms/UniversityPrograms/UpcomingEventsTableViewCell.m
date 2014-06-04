//
//  upcomingEventsTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UpcomingEventsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Colours.h"
#import "DateTools.h"

@implementation UpcomingEventsTableViewCell

-(instancetype)init{
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([UpcomingEventsTableViewCell class]) owner:nil options:nil][0];
   
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
-(void)buildWithEvent:(Event *)event{
    self.backgroundColor= [UIColor creamColor];
    NSString *string = [[NSString alloc]initWithFormat:@"%@", event.imageUrl];
    NSLog(@"%@",string);
    NSURL *url = [NSURL URLWithString:string];
    
    
    [self.eventImage setImageWithURL:url];
    self.eventImage.backgroundColor=[UIColor creamColor];
    self.eventTitle.text=event.Name;
    if(event.isRegistered){
        self.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    
    NSString *dateString = [[NSString alloc] initWithFormat:@"From:%@ Until %@",[event.StartDate formattedDateWithFormat:@"mm-dd-hh"],[event.EndDate formattedDateWithFormat:@"mm-dd-hh"]];
    self.dateLabel.text=dateString;
}
@end
