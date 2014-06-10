//
//  PriorFeedbackTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/3/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

static const NSInteger PriorFeedbackTableViewCellHeight = 60;

@interface PriorFeedbackTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
-(instancetype)init;
-(void)buildWithComment:(Comment *)comment;
+(CGFloat)heightForComment:(Comment *)comment;
@end
