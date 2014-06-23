//
//  UPTabbarViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/10/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UPTabbarViewController.h"
#import "UPViewController.h"
#import "UIColor+UPColors.h"

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
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UPViewController *)viewController{
    [viewController viewDidAppear:NO];
}

-(void)buildIntroView{
    
    MYBlurIntroductionView *introView = [[MYBlurIntroductionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    introView.backgroundColor = [UIColor UPDarkGreyColor];
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome" description:@"Thank you for downloading the official University of Alabama University Programs app. Here is a quick introduction to show you all the features you can take advantage of in this app. Swipe the page to continue the introduction."];
    MYIntroductionPanel *panel2 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Events" description:@"The main page of the app is a list of all upcoming University Programs sponsored events" image:[UIImage imageNamed:@"eventsScreenshot.png"]];
    MYIntroductionPanel *panel3 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Specific Event" description:@"If you click on an event, you will see this screen. The name, location, Date/Time and a brief description of the event is displayed. There are share buttons for Facebook and Twitter at the bottom of the page that allow you to post that you are attending the event." image:[UIImage imageNamed:@"specificScreenshot"]];
    MYIntroductionPanel *panel4 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"RSVPing" description:@"In the upper right hand corner is an RSVP button. This allows you to notify UP that you are attending the event." image:[UIImage imageNamed:@"rsvpScreenshot"]];
    MYIntroductionPanel *panel5 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"User Info" description:@"Before you can RSVP, you must first fill out the User Info Form. You cannot RSVP without filling out the complete form." image:[UIImage imageNamed:@"userInfoScreenshot"]];
    MYIntroductionPanel *panel6 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Comments" description:@"Once you have filled out your User Info, you will also be able to send comments or notes to UP. The comment button can be found under My UP and Contact UP tabs." image:[UIImage imageNamed:@"commentScreenshot"]];
    MYIntroductionPanel *panel7 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"My UP" description:@"If you want to change settings or your User Info, the My UP tab is where you go to. Also, your RSVPed events and prior comments are shown here as well." image:[UIImage imageNamed:@"myUserScreenshot"]];
    MYIntroductionPanel *panel8 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Settings" description:@"If you press the settings button in the upper right hand corner of the My UP page, you will see this page which allows you to customize the appearance of your app." image:[UIImage imageNamed:@"settingsScreenshot"]];
    
    //panel1.PanelTitleLabel.textColor = [UIColor darkTextColor];
    //panel1.PanelDescriptionLabel.textColor = [UIColor darkTextColor];
    /*
    MYIntroductionPanel *panel1 = [[MYIntroductionPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"IntroPanel1"];
    [panel1 buildPanelWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    */
    panel2.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel3.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel4.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel5.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel6.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel7.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    panel8.PanelImageView.contentMode = UIViewContentModeScaleAspectFit;
    [introView buildIntroductionWithPanels:@[panel1, panel2, panel3, panel4, panel5, panel6, panel7,panel8]];
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
