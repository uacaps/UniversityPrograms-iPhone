//
//  SettingsViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/12/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "SettingsViewController.h"
#import "UPNavigationViewController.h"
#import "UIColor+UPColors.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *darkModeToggle;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSelector;
@property (weak, nonatomic) IBOutlet UILabel *darkModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorSchemeLabel;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Settings";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.colorSelector setSelectedSegmentIndex:[UIColor getThemeColorIndex]];
    [self.darkModeToggle setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"darkMode"]];
    [self changedColorScheme:self];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor getStyleColor];
    self.colorSchemeLabel.backgroundColor = [UIColor getStyleColor];
    self.darkModeLabel.backgroundColor = [UIColor getStyleColor];
    self.colorSchemeLabel.textColor = [UIColor getTextColor];
    self.darkModeLabel.textColor = [UIColor getTextColor];
}
- (IBAction)toggledDarkMode:(id)sender {
    if(self.darkModeToggle.on){
        //self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
        self.tabBarController.tabBar.barStyle=UIBarStyleBlackOpaque;
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
            [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [[UITableView appearance] setBackgroundColor:[UIColor getStyleColor]];
            [self viewWillAppear:NO];
        }
    }
    else{
        //self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.tabBarController.tabBar.barStyle=UIBarStyleDefault;
        [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
            UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
            controller.navigationBar.barStyle = UIBarStyleDefault;
            [[UITableView appearance] setBackgroundColor:[UIColor getStyleColor]];
            [self viewWillAppear:NO];
        }
    }
    
    
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
    
    [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //[UITabBar appearance].tintColor=[UIColor getThemeColor];
    for (int index=0; index<self.tabBarController.viewControllers.count; index++) {
        UPNavigationViewController *controller = [self.tabBarController.viewControllers objectAtIndex:index];
        controller.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor getThemeColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
        controller.tabBarController.tabBar.tintColor = [UIColor getThemeColor];
    }
    [self viewWillAppear:NO];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
