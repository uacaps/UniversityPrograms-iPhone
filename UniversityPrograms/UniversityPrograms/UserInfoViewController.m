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
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeLabel;
@property UIBarStyle *currentSyle;


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
    
    [self.darkModeToggle setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"darkMode"]];
    self.firstName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"];
    self.lastName.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"];
    self.cwid.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
    self.email.text=[[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    [self changedColorScheme:self];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveInfo)];
    // Do any additional setup after loading the view from its nib.
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor getStyleColor];
    self.userLabel.backgroundColor = [UIColor getStyleColor];
    self.colorLabel.backgroundColor = [UIColor getStyleColor];
    self.modeLabel.backgroundColor = [UIColor getStyleColor];
    self.userLabel.textColor = [UIColor getTextColor];
    self.colorLabel.textColor = [UIColor getTextColor];
    self.modeLabel.textColor = [UIColor getTextColor];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Interactions

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)toggledDarkMode:(id)sender {
    if(self.darkModeToggle.on){
        self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
        self.tabBarController.tabBar.barStyle=UIBarStyleBlackOpaque;
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
           UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
        }
    }
    else{
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.tabBarController.tabBar.barStyle=UIBarStyleDefault;
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.navigationBar.barStyle = UIBarStyleDefault;
        }
    }
    [self viewWillAppear:NO];
}

- (IBAction)changedColorScheme:(id)sender {
    if(self.colorSelector.selectedSegmentIndex==0){
        self.colorSelector.tintColor = [UIColor UPCrimsonColor];
        self.darkModeToggle.onTintColor = [UIColor UPCrimsonColor];
    }
    else if(self.colorSelector.selectedSegmentIndex==1){
        self.colorSelector.tintColor = [UIColor grassColor];
        self.darkModeToggle.onTintColor = [UIColor grassColor];
    }
    else if(self.colorSelector.selectedSegmentIndex==2){
        self.colorSelector.tintColor = [UIColor tealColor];
        self.darkModeToggle.onTintColor = [UIColor tealColor];
    }
    else{
        self.colorSelector.tintColor = [UIColor goldenrodColor];
        self.darkModeToggle.onTintColor = [UIColor goldenrodColor];
    }
    
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
        [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor getThemeColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
            controller.tabBarController.tabBar.tintColor = [UIColor getThemeColor];
        }
        
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
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Settings Saved!" message:@"Your information and color theme settings have been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
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
