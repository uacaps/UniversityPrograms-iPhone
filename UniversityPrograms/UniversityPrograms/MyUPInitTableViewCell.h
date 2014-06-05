//
//  MyUPInitTableViewCell.h
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/5/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUPInitTableViewCell : UITableViewCell
-(instancetype)init;
@property (weak, nonatomic) IBOutlet UIImageView *myUPImage;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cwidLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

-(void)build;
@end
