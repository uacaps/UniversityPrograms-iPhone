//
//  upcomingEventsTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
@interface UpcomingEventsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
-(void)buildWithEvent:(Event *)event;

@end
