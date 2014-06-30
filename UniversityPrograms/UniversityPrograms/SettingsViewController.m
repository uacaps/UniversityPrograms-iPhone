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
@property (weak, nonatomic) IBOutlet UIView *dividerView;
@property NKOColorPickerView *colorPickerView;
@property NSOperationQueue *queue;
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
    [self changedColorScheme: [UIColor getThemeColor]];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    UIColor *textColor=[UIColor getTextColor];
    UIColor *styleColor=[UIColor getStyleColor];
    UIColor *themeColor=[UIColor getThemeColor];
    
    self.view.backgroundColor = styleColor;
    self.colorSchemeLabel.backgroundColor = styleColor;
    self.darkModeLabel.backgroundColor = styleColor;
    self.colorSchemeLabel.textColor = textColor;
    self.darkModeLabel.textColor = textColor;
    self.dividerView.backgroundColor = themeColor;
    self.colorSelector.tintColor = themeColor;
    self.darkModeToggle.onTintColor = themeColor;
    self.colorSelector.backgroundColor = styleColor;
    self.darkModeToggle.backgroundColor = styleColor;
    self.tabBarController.tabBar.tintColor = themeColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : themeColor, NSFontAttributeName : [UIFont systemFontOfSize:20]};
}
- (IBAction)toggledDarkMode:(id)sender {
    if(self.darkModeToggle.on){
        //self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
        self.tabBarController.tabBar.barStyle=UIBarStyleBlackOpaque;
        //[[UITextView appearance] setKeyboardAppearance:UIKeyboardAppearanceDark];
        [[UITextField appearance] setKeyboardAppearance:UIKeyboardAppearanceDark];
        [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
        [self viewWillAppear:NO];
    }
    else{
        //[[UITextView appearance] setKeyboardAppearance:UIKeyboardAppearanceLight];
        [[UITextField appearance] setKeyboardAppearance:UIKeyboardAppearanceLight];
        //self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.tabBarController.tabBar.barStyle=UIBarStyleDefault;
        [[NSUserDefaults standardUserDefaults] setBool:self.darkModeToggle.on forKey:@"darkMode"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        [self viewWillAppear:NO];
    }
    
    
}


-(void)changedColorScheme:(UIColor *)color {
    
    if(self.colorSelector.selectedSegmentIndex==0){
        self.colorSelector.tintColor = [UIColor UPCrimsonColor];
        self.darkModeToggle.onTintColor = [UIColor UPCrimsonColor];
        [UIColor setThemeColor:[UIColor UPCrimsonColor]];
        [self viewWillAppear:NO];
        [self.colorPickerView removeFromSuperview];
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
    }
    else if(self.colorSelector.selectedSegmentIndex==1){
        self.colorSelector.tintColor = [UIColor grassColor];
        self.darkModeToggle.onTintColor = [UIColor grassColor];
        [UIColor setThemeColor:[UIColor grassColor]];
        [self viewWillAppear:NO];
        [self.colorPickerView removeFromSuperview];
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
    }
    else if(self.colorSelector.selectedSegmentIndex==2){
        self.colorSelector.tintColor = [UIColor tealColor];
        self.darkModeToggle.onTintColor = [UIColor tealColor];
        [UIColor setThemeColor:[UIColor tealColor]];
        [self viewWillAppear:NO];
        [self.colorPickerView removeFromSuperview];
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
        
    }
    else{
        
        [[NSUserDefaults standardUserDefaults] setInteger:self.colorSelector.selectedSegmentIndex forKey:@"colorSelection"];
        self.colorSelector.tintColor = [UIColor getThemeColor];
        self.darkModeToggle.onTintColor = [UIColor getThemeColor];
        
        
        NKOColorPickerDidChangeColorBlock changeBlock = ^(UIColor *color){
            [UIColor setThemeColor:color];
            [self viewWillAppear:NO];
        };
        
        if(!self.colorPickerView){
            self.colorPickerView = [[NKOColorPickerView alloc] initWithFrame:CGRectMake(10, 150, 300, 200) color:[UIColor getThemeColor] andDidChangeColorBlock:changeBlock];
        }
        [self.view addSubview:self.colorPickerView];
        self.colorPickerView.color=[UIColor getThemeColor];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //[UITabBar appearance].tintColor=[UIColor getThemeColor];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
