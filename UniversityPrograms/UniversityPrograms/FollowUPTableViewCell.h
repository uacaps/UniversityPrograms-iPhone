//
//  FollowUPTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSInteger FollowTableViewCellHeight = 125;

@interface FollowUPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *followUPLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainTwitterLabel;
@property (weak, nonatomic) IBOutlet UIButton *mainTwitterButton;
@property (weak, nonatomic) IBOutlet UILabel *mainFacebookLabel;


-(void)build;

@end
