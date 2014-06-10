//
//  MyUPInitTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/5/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

static const NSInteger MyUPTableViewCellHeight = 125;

@interface MyUPInitTableViewCell : UITableViewCell
-(instancetype)init;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberAttending;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *actualNumberAttending;


-(void)buildWithEvent:(Event *)e;
@end
