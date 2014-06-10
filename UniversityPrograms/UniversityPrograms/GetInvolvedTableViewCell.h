//
//  GetInvolvedTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetInvolvedCellData.h"
static const NSInteger GetInvolvedTableViewCellHeight = 100;

@interface GetInvolvedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyTextLabel;
+(CGFloat)heightForData:(GetInvolvedCellData *)data;
@end
