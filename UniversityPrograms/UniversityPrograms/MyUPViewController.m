//
//  MyUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "MyUPViewController.h"
#import "commentViewController.h"
#import "UserInfoViewController.h"
#import "PriorFeedbackViewController.h"


@interface MyUPViewController ()

@end

@implementation MyUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"My UP";
    }
    return self;
}

-(IBAction)didSelectComment:(id)sender{
    commentViewController *comments = [[commentViewController alloc] init];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.view.backgroundColor=[UIColor blackColor];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
