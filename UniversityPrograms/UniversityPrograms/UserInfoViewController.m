//
//  UserInfoViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UPNavigationViewController.h"
#import "UIColor+UPColors.h"
#import "Colours.h"
@import QuartzCore;

@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *cwid;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UIView *firstDivider;
@property (weak, nonatomic) IBOutlet UIView *secondDivider;
@property (weak, nonatomic) IBOutlet UIView *thirdDivider;
@property UIBarStyle *currentSyle;


@end

@implementation UserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"User";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.firstName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"];
    self.lastName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"];
    self.cwid.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
    self.email.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    
    
    // Do any additional setup after loading the view from its nib.
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor getStyleColor];
    self.userLabel.backgroundColor = [UIColor getStyleColor];
    self.firstName.textColor = [UIColor getTextColor];
    self.lastName.textColor = [UIColor getTextColor];
    self.email.textColor =[UIColor getTextColor];
    self.cwid.textColor = [UIColor getTextColor];
    //self.firstName.tintColor = [UIColor getThemeColor];
    self.userLabel.textColor = [UIColor getThemeColor];
    self.firstName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.lastName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.cwid.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CWID" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.firstDivider.backgroundColor = [UIColor getThemeColor];
    self.secondDivider.backgroundColor = [UIColor getThemeColor];
    self.thirdDivider.backgroundColor = [UIColor getThemeColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Interactions
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveInfo)];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}
#pragma mark - save info

- (void)saveInfo{
    
    if([self.cwid.text length]<8 || [self.cwid.text length]>8){
        [self addInvalidAlertView];
        
    }
    else{
        [[NSUserDefaults standardUserDefaults] setValue:self.firstName.text forKey:@"userFirstName"];
        [[NSUserDefaults standardUserDefaults] setValue:self.lastName.text forKey:@"userLastName"];
        [[NSUserDefaults standardUserDefaults] setValue:self.cwid.text forKey:@"cwid"];
        [[NSUserDefaults standardUserDefaults] setValue:self.email.text forKey:@"email"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        [self addAlertView];
    }
    
     
}


#pragma mark - alert view methods

-(void)addInvalidAlertView{
    UIAlertView *invalidAlert = [[UIAlertView alloc]initWithTitle:@"Invalid CWID!" message:@"Your CWID must be 8 number long." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [invalidAlert setTag:3];
    [invalidAlert show];
}

-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Information Saved!" message:@"Your information settings have been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert setTag:1];
    [saveAlert show];
}

- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==1){
    
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
