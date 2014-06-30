//
//  DirectoryTableViewCell.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/6/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "DirectoryTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Colours.h"
#import "UIColor+UPColors.h"
@import QuartzCore;

@interface DirectoryTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIImageView *telephoneImage;
@property (weak, nonatomic) IBOutlet UIImageView *mailImage;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property Employee *selectedEmployee;
@end

@implementation DirectoryTableViewCell
-(instancetype)init{
    self=[super init];
    //init is such a way that the xib file actually works
    self=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DirectoryTableViewCell class]) owner:nil options:nil][0];
    
    return self;
}

-(void)buildWtihEmployee:(Employee *)emp{
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    self.selectedEmployee = emp;
    self.employeeEmail.text=emp.email;
    //self.employeeImage.layer.cornerRadius=2;
    [self.employeeImage setImageWithURL:[[NSURL alloc] initWithString:emp.imageURL]];
    
    self.employeeName.text=emp.name;
    self.employeePhone.text=[NSString stringWithFormat:@"Phone: %@", emp.phone];
    self.employeeEmail.text=[NSString stringWithFormat:@"Email: %@", emp.email];
    self.employeeTitle.text=emp.title;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.employeeImage.layer.cornerRadius=self.employeeImage.frame.size.width/2;
    
    
    //NSLog([NSString stringWithFormat:@"%@", emp.phone]);
    self.employeeName.textColor = themeColor;
    self.employeeTitle.textColor = themeColor;
    self.employeeEmail.backgroundColor = styleColor;
    self.employeeTitle.backgroundColor = styleColor;
    self.employeePhone.textColor = textColor;
    self.employeeEmail.textColor = textColor;
    self.employeePhone.backgroundColor = styleColor;
    self.employeeName.backgroundColor = styleColor;
    self.backgroundColor = styleColor;
    self.emailButton.backgroundColor = styleColor;
    
    if([emp.phone isEqualToString:@"Graduate"]||[emp.phone isEqualToString:@"Senior"]||[emp.phone isEqualToString:@"Junior"]||[emp.phone isEqualToString:@"2nd Year Law"]||[emp.phone isEqualToString:@"Sophomore"]||[emp.phone isEqualToString:@"Freshman"]||[emp.phone isEqualToString:@"1st Year Law"]){
        self.phoneButton.alpha=0.0f;
        self.employeePhone.text=[NSString stringWithFormat:@"Year: %@", emp.phone];
        self.employeeEmail.text=[NSString stringWithFormat:@"Major: %@", emp.email];
        self.telephoneImage.alpha = 0.0f;
        self.mailImage.alpha = 0.0f;
        self.emailButton.alpha = 0.0f;
    }
    else {
        self.phoneButton.alpha=1.0f;
        self.telephoneImage.alpha = 1.0f;
        self.mailImage.alpha = 1.0f;
        self.emailButton.alpha = 1.0f;
    }
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
- (IBAction)didSelectPhoneNumber:(id)sender {
    
    //NSLog(@"phone tap");
    //self.employeePhone.backgroundColor=[UIColor grassColor];
    NSString *telephoneURLString = [NSString stringWithFormat:@"tel://%@", self.selectedEmployee.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telephoneURLString]];
    //NSLog(@"%@", telephoneURLString);
    //self.employeePhone.backgroundColor=[UIColor whiteColor];
}
- (IBAction)didTapEmailButton:(id)sender {
    NSString *emailString = [NSString stringWithFormat:@"mailto:%@", self.selectedEmployee.email];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:emailString]];
    //NSLog(@"%@", emailString);
}

@end
