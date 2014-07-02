//
//  UPTabbarViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/10/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//
#import "UPNavigationViewController.h"
#import "UPTabbarViewController.h"
#import "UPViewController.h"
#import "UIColor+UPColors.h"
#import "IntroPanel.h"
#import "ContactUPViewController.h"
#import "MyUPViewController.h"
@interface UPTabbarViewController ()

@end

@implementation UPTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate=self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UPNavigationViewController *)navController{
     UPViewController *test = navController.rootViewController;
    [test updateViews];
    navController.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor getThemeColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"darkMode"]){
        navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    }
    else{
        navController.navigationBar.barStyle = UIBarStyleDefault;
    }
    
    
}

-(void)buildIntroView{
    
    MYBlurIntroductionView *introView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //introView.backgroundColor = [UIColor UPDarkGreyColor];
    IntroPanel *panel1 = [[IntroPanel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPanel1"];
    introView.backgroundColor = panel1.backgroundColor;
    panel1.backgroundColor = [UIColor clearColor];
    //MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome" description:@"Thank you for downloading the official University of Alabama University Programs app. Here is a quick introduction to show you all the features you can take advantage of in this app. Swipe the page to continue the introduction."];
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Events" description:@"The main page of the app is a list of all upcoming University Programs sponsored events" image:[UIImage imageNamed:@"eventsScreenshot.png"]];
    
    MYIntroductionPanel *panel4 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"RSVPing" description:@"If you click on an event, you will see this screen. The Name, Location, Date/Time and a brief description of the event is displayed along with share buttons for Twitter and Facebook. In the upper right hand corner is an RSVP button, click it once to RSVP, click it again to unRSVP." image:[UIImage imageNamed:@"rsvpScreenshot"]];
    MYIntroductionPanel *panel5 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"About UP" description:@"A brief description of who we are and what we do is provided on the 'About UP' tab. The programs we are involved in and ways for you to get involved are also listed here." image:[UIImage imageNamed:@"aboutScreenshot"]];
    
    MYIntroductionPanel *panel6 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Contact UP" description:@"If you ever need to contact us, the 'Contact UP' tab provides you with our mailing address and one tap acccess to our program directors. A map to our building is also provided." image:[UIImage imageNamed:@"contactScreenshot"]];
    
    MYIntroductionPanel *panel7 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"My UP" description:@"If you want to change settings or your User Info, the My UP tab is where you go to. Also, your RSVPed events and prior comments are shown here as well." image:[UIImage imageNamed:@"myUserScreenshot"]];
    
    
    //panel1.PanelTitleLabel.textColor = [UIColor darkTextColor];
    //panel1.PanelDescriptionLabel.textColor = [UIColor darkTextColor];
    /*
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPanel1"];
    [panel1 buildPanelWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    */
    panel2.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    panel4.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel5.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel6.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    panel7.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [introView buildIntroductionWithPanels:@[panel1, panel2, panel4, panel6, panel7]];
    [self.view addSubview:introView];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
