//
//  PriorFeedbackTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/3/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "PriorFeedbackTableViewCell.h"
#import "Colours.h"
#import "UIColor+UPColors.h"
@implementation PriorFeedbackTableViewCell

-(instancetype)init{
    self=[super init];
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PriorFeedbackTableViewCell class]) owner:nil options:nil][0];
   
    return self;
}

-(void)buildWithComment:(Comment *)comment{
    self.titleLabel.text=comment.commentTitle;
    self.titleLabel.backgroundColor = [UIColor getStyleColor];
    self.commentLabel.text=comment.commentText;
    self.commentLabel.backgroundColor = [UIColor getStyleColor];
    self.backgroundColor= [UIColor getStyleColor];
    [self.commentLabel setTextColor:[UIColor getTextColor]];
    self.titleLabel.textColor = [UIColor getThemeColor];
    //Get frame sizes
    float textHeight = [comment.commentText boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:14.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    //Set frame sizes
    self.commentLabel.frame = CGRectMake(self.commentLabel.frame.origin.x, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, textHeight);
    self.frame = CGRectMake(0, 0, self.frame.size.width, 35 + textHeight);
    
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

+(CGFloat)heightForComment:(Comment *)comment{
    float textHeight = [comment.commentText boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:14.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    return textHeight + 35;
}

@end
