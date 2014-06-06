//
//  DirectoryTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *employeeImage;
@property (weak, nonatomic) IBOutlet UILabel *employeeName;
@property (weak, nonatomic) IBOutlet UILabel *employeeTitle;
@property (weak, nonatomic) IBOutlet UILabel *employeePhone;
@property (weak, nonatomic) IBOutlet UILabel *employeeEmail;


@end
