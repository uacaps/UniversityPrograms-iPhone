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
@property (weak, nonatomic) IBOutlet UIView *firstDivider;
@property (weak, nonatomic) IBOutlet UIView *secondDivider;
@property (weak, nonatomic) IBOutlet UIView *thirdDivider;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;
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
    
    self.firstName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    // Do any additional setup after loading the view from its nib.
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor getStyleColor];
    self.notificationLabel.backgroundColor = [UIColor getStyleColor];
    self.notificationLabel.textColor = [UIColor getTextColor];
    self.firstName.textColor = [UIColor getTextColor];
    self.lastName.textColor = [UIColor getTextColor];
    self.email.textColor =[UIColor getTextColor];
    self.cwid.textColor = [UIColor getTextColor];
    //self.firstName.tintColor = [UIColor getThemeColor];
    
    self.firstName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.lastName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.cwid.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CWID" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.firstDivider.backgroundColor = [UIColor getThemeColor];
    self.secondDivider.backgroundColor = [UIColor getThemeColor];
    self.thirdDivider.backgroundColor = [UIColor getThemeColor];
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"darkMode"]){
        self.email.keyboardAppearance = UIKeyboardAppearanceDark;
        self.cwid.keyboardAppearance = UIKeyboardAppearanceDark;
        self.lastName.keyboardAppearance = UIKeyboardAppearanceDark;
        self.firstName.keyboardAppearance = UIKeyboardAppearanceDark;
    }
    else{
        self.email.keyboardAppearance = UIKeyboardAppearanceLight;
        self.cwid.keyboardAppearance = UIKeyboardAppearanceLight;
        self.lastName.keyboardAppearance = UIKeyboardAppearanceLight;
        self.firstName.keyboardAppearance = UIKeyboardAppearanceLight;
    }
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
- (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
}

- (void)saveInfo{
  
    if([self.cwid.text length]<8 || [self.cwid.text length]>8||![self validateString:self.cwid.text withPattern:@"^[0-9]{8}$"] || ![self validateString:self.lastName.text withPattern:@"^[a-zA-Z]{1,}$"]|| ![self validateString:self.email.text withPattern:@"^[a-zA-Z][a-zA-Z0-9]{1,63}@[a-zA-Z0-9]{1,64}(?:\\.[a-zA-Z0-9]{2,64})*\\.[a-zA-Z]{3,5}$"]||![self validateString:self.firstName.text withPattern:@"^[a-zA-Z]{1,}$"]){
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
    UIAlertView *invalidAlert = [[UIAlertView alloc]initWithTitle:@"Invalid Info!" message:@"You must provide valid first and last names, 8 digit CWID and email before registering." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
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
