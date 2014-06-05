//
//  MyUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "MyUPViewController.h"
#import "CommentViewController.h"
#import "UserInfoViewController.h"
#import "PriorFeedbackViewController.h"
#import "Colours.h"
#import "UIColor+UPColors.h"
@import QuartzCore;
@interface MyUPViewController ()

@end

@implementation MyUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"My UP";
    }
    self.tabBarItem.image= [UIImage imageNamed:@"Cog.png"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"Cog_filled.png"];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.priorFeedback.layer.cornerRadius=10.0;
    self.userInfoButton.layer.cornerRadius=10.0;
    self.commentButton.layer.cornerRadius=10.0;
    self.priorFeedback.backgroundColor=[UIColor UPTealColor];
    self.userInfoButton.backgroundColor=[UIColor UPPeachColor];

    self.view.backgroundColor=[UIColor UPPlumColor];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didSelectComment:(id)sender{
    CommentViewController *comments = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:comments
                                         animated:YES];
}

-(IBAction)didSelectUser:(id)sender{
    UserInfoViewController *userInfo = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfo animated:YES];
}
- (IBAction)didSelectPriorFeedback:(id)sender {
    PriorFeedbackViewController *feedbackInfo = [[PriorFeedbackViewController alloc] init];
    [self.navigationController pushViewController:feedbackInfo animated:YES];
}

@end
