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
@property (weak, nonatomic) IBOutlet UISwitch *darkModeToggle;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSelector;


@end

@implementation UserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Settings";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.colorSelector setSelectedSegmentIndex:[UIColor getThemeColorIndex]];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.darkModeToggle setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"darkMode"]];
    self.firstName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"];
    self.lastName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"];
    self.cwid.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
    self.email.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    [self changedColorScheme:self];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveInfo)];
    // Do any additional setup after loading the view from its nib.
    
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)toggledDarkMode:(id)sender {
    if(self.darkModeToggle.on){
        self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
        self.tabBarController.tabBar.barStyle=UIBarStyleBlackOpaque;
        //[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"darkMode"];
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
           UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            
            controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
            
        }
        //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
    }
    else{
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.tabBarController.tabBar.barStyle=UIBarStyleDefault;
        //[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"darkMode"];
        //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            
            controller.navigationBar.barStyle = UIBarStyleDefault;
            
        }
    }
    
}

- (IBAction)changedColorScheme:(id)sender {
    if(self.colorSelector.selectedSegmentIndex==0){
        self.colorSelector.tintColor = [UIColor brickRedColor];
        self.darkModeToggle.onTintColor = [UIColor brickRedColor];
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.themeColor = [UIColor goldenrodColor];
            controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor brickRedColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
            controller.tabBarController.tabBar.tintColor = [UIColor brickRedColor];
            
        }
        
    }
    else if(self.colorSelector.selectedSegmentIndex==1){
        self.colorSelector.tintColor = [UIColor grassColor];
        self.darkModeToggle.onTintColor = [UIColor grassColor];
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.themeColor = [UIColor goldenrodColor];
            controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grassColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
            controller.tabBarController.tabBar.tintColor = [UIColor grassColor];
            
        }
    }
    else if(self.colorSelector.selectedSegmentIndex==2){
        self.colorSelector.tintColor = [UIColor tealColor];
        self.darkModeToggle.onTintColor = [UIColor tealColor];
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.themeColor = [UIColor goldenrodColor];
            controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor tealColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
            controller.tabBarController.tabBar.tintColor = [UIColor tealColor];
            
        }
        
    }
    else{
        self.colorSelector.tintColor = [UIColor goldenrodColor];
        self.darkModeToggle.onTintColor = [UIColor goldenrodColor];
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.themeColor = [UIColor goldenrodColor];
            controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor goldenrodColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
            controller.tabBarController.tabBar.tintColor = [UIColor goldenrodColor];
            
        }
    }
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
        [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
        //[[NSUserDefaults standardUserDefaults] setObject:[NSNumber ] forKey:@"indexColorSelected"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //self.darkModeToggle.isOn=[[NSUserDefaults standardUserDefaults] setBool:false forKey:@"darkMode"];
     
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
