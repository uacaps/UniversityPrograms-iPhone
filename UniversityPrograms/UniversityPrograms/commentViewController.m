//
//  commentViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "commentViewController.h"
#import "Colours.h"
@interface commentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *subjectBox;
@property (weak, nonatomic) IBOutlet UITextField *emailBox;
@property (weak, nonatomic) IBOutlet UITextView *commentBox;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation commentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Leave a Comment";
    }
    self.view.backgroundColor = [UIColor brickRedColor];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.commentBox.layer.borderWidth=2.0f;
    //self.commentBox.layer.borderColor=[[UIColor grayColor]CGColor];
    self.emailBox.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
    /*
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    scrollview.backgroundColor=[UIColor burntOrangeColor];
    scrollview.scrollEnabled=YES;
    scrollview.pagingEnabled=YES;
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.contentSize=CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height*2);
    [self.view addSubview:scrollview];
     */
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)didTapSubmit:(id)sender {
}
- (IBAction)didTapCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
