//
//  PriorFeedbackTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/3/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "PriorFeedbackTableViewCell.h"
#import "Colours.h"

@implementation PriorFeedbackTableViewCell

-(instancetype)init{
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PriorFeedbackTableViewCell class]) owner:nil options:nil][0];
   
    return self;
}
-(void)buildWithComment:(Comment *)c{
    self.titleLabel.text=c.commentTitle;
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.commentLabel.text=c.commentText;
    self.commentLabel.backgroundColor = [UIColor whiteColor];
    self.backgroundColor= [UIColor whiteColor];
    [self.commentLabel setTextColor:[UIColor darkGrayColor]];
    
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
