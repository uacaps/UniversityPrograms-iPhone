//
//  GetInvolvedTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "GetInvolvedTableViewCell.h"

@implementation GetInvolvedTableViewCell
-(instancetype)init{
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GetInvolvedTableViewCell class]) owner:nil options:nil][0];
    self.titleLabel.backgroundColor=[UIColor whiteColor];
    self.bodyTextLabel.backgroundColor = [UIColor whiteColor];
    
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

@end
