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
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    self.titleLabel.text=comment.commentTitle;
    self.titleLabel.backgroundColor = styleColor;
    self.commentLabel.text=comment.commentText;
    self.commentLabel.backgroundColor = styleColor;
    self.backgroundColor= styleColor;
    [self.commentLabel setTextColor:textColor];
    self.titleLabel.textColor = themeColor;
    //Get frame sizes
    float textHeight = [comment.commentText boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    //Set frame sizes
    self.commentLabel.frame = CGRectMake(self.commentLabel.frame.origin.x, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, textHeight);
    self.frame = CGRectMake(0, 0, self.frame.size.width, 35 + textHeight);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    float textHeight = [comment.commentText boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    return textHeight + 35;
}

@end
