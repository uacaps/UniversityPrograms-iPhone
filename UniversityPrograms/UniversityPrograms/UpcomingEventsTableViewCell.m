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
@import QuartzCore;

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
    NSString *string = [[NSString alloc]initWithFormat:@"%@", event.imageUrl];
    //NSLog(@"%@",string);
    NSURL *url = [NSURL URLWithString:string];
    
    [self.eventImage setImageWithURL:url];
    //_eventImage.layer.cornerRadius = self.eventImage.frame.size.width/2;
    
    self.eventTitle.text=event.eventName;
    if(event.isRegistered){
        //self.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    
    //Set date before began

    if ([event.startDate isLaterThan:[NSDate date]]) {
        int daysFromNow = event.startDate.daysUntil;
        if (daysFromNow > 0) {
            self.dateLabel.text= [NSString stringWithFormat:@"in %dd", daysFromNow];
            return;
        }
        else {
            int hoursFromNow = event.startDate.hoursUntil;
            if (hoursFromNow > 0) {
                self.dateLabel.text= [NSString stringWithFormat:@"in %dh", hoursFromNow];
            }
            else {
                int minutesFromNow = event.startDate.minutesUntil;
                if (minutesFromNow > 0) {
                    self.dateLabel.text= [NSString stringWithFormat:@"in %dm", minutesFromNow];
                }
            }
        }
    }
    //Check for in "happening now" and already done
    else if([event.startDate isEarlierThan:[NSDate date]]&&[event.endDate isLaterThan:[NSDate date]]){
        self.dateLabel.text=[NSString stringWithFormat:@"Now"];
    }
    else{
        self.dateLabel.text=[NSString stringWithFormat:@"Over."];
    }
    
    //NSString *dateString = [[NSString alloc] initWithFormat:@"From: %@ Until: %@",[event.startDate formattedDateWithFormat:@"hh:mm MM-dd"],[event.endDate formattedDateWithFormat:@"hh:mm MM-dd"]];
    
}
@end
