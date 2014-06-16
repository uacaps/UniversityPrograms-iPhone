//
//  GetInvolvedTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "GetInvolvedTableViewCell.h"
#import "UIColor+UPColors.h"
@implementation GetInvolvedTableViewCell
-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GetInvolvedTableViewCell class]) owner:nil options:nil][0];
    
    
    return self;
}
-(void)buildWithData:(GetInvolvedCellData *)data{
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    self.titleLabel.backgroundColor=styleColor;
    self.bodyTextLabel.backgroundColor = styleColor;
    self.backgroundColor=styleColor;
    self.bodyTextLabel.text=data.text;
    self.titleLabel.text=data.title;
    self.bodyTextLabel.textColor = textColor;
    self.titleLabel.textColor = themeColor;
    float textHeight = [data.text boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    //Set frame sizes
    self.bodyTextLabel.frame = CGRectMake(self.bodyTextLabel.frame.origin.x, self.bodyTextLabel.frame.origin.y, self.bodyTextLabel.frame.size.width, textHeight);
    self.frame = CGRectMake(0, 0, self.frame.size.width, 45 + textHeight);
    
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
+(CGFloat)heightForData:(GetInvolvedCellData *)data{
    float textHeight = [data.text boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    return textHeight + 45;
}
@end
