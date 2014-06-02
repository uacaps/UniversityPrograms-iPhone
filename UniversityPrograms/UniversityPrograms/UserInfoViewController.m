//
//  UserInfoViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *cwid;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation UserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Save My Info";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstName.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"userFirstName"];
    self.lastName.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"userLastName"];
    self.cwid.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"];
    self.email.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
    // Do any additional setup after loading the view from its nib.
    
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)saveInfo:(id)sender {
    
     [[NSUserDefaults standardUserDefaults] setValue:self.firstName.text forKey:@"userFirstName"];
     [[NSUserDefaults standardUserDefaults] setValue:self.lastName.text forKey:@"userLastName"];
     [[NSUserDefaults standardUserDefaults] setValue:self.cwid.text forKey:@"cwid"];
     [[NSUserDefaults standardUserDefaults] setValue:self.email.text forKey:@"email"];
     [[NSUserDefaults standardUserDefaults]synchronize];
     
     UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Info Saved!" message:@"Your Information has been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
     [saveAlert show];
    //[self.navigationController popViewControllerAnimated:YES];
     
}

- (IBAction)didTapCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Info Saved!" message:@"Your Information has been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert show];
}

- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
