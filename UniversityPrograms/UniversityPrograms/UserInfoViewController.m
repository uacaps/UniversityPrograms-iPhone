//
//  UserInfoViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UIColor+UPColors.h"
#import "Colours.h"
@import QuartzCore;

@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *cwid;
@property (weak, nonatomic) IBOutlet UITextField *email;


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
    self.view.backgroundColor = [UIColor UPDarkGreyColor];
    
    self.firstName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"];
    self.lastName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"];
    self.cwid.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
    self.email.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveInfo)];
    // Do any additional setup after loading the view from its nib.
    
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


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
    //[self.navigationController popViewControllerAnimated:YES];
     
}

- (IBAction)didTapCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addInvalidAlertView{
    UIAlertView *invalidAlert = [[UIAlertView alloc]initWithTitle:@"Invalid CWID!" message:@"Your CWID must be 8 number long." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [invalidAlert setTag:3];
    [invalidAlert show];
}

-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Info Saved!" message:@"Your Information has been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert setTag:1];
    [saveAlert show];
}

- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==1){
    
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
