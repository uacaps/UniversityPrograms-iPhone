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
    
    //NSURL *url = [NSURL URLWithString:@"http://wow.ua.edu/images/WOWlogo2014.png"];
    
    
    
    return self;
}
-(void)buildWithComment:(Comment *)c{
    self.titleLabel.text=c.Title;
    self.descriptionBox.text=c.CommentText;
    self.backgroundColor= [UIColor whiteColor];
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
