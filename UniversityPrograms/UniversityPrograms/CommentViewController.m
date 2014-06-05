//
//  commentViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "CommentViewController.h"
#import "UPDataRetrieval.h"
#import "Colours.h"
#import "Comment.h"
#import "NSObject+ObjectMap.h"
#import "UIColor+UPColors.h"

@interface CommentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *subjectBox;
@property (weak, nonatomic) IBOutlet UITextField *emailBox;
@property (weak, nonatomic) IBOutlet UITextView *commentBox;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameBox;
@property (weak, nonatomic) IBOutlet UITextField *lastNameBox;

@end

@implementation CommentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Leave a Comment";
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.submitButton.layer.cornerRadius=10.0;
    self.cancelButton.layer.cornerRadius=10.0;
    [self.submitButton setBackgroundColor:[UIColor successColor]];
    [self.cancelButton setBackgroundColor:[UIColor brickRedColor]];
    [self.bigView setBackgroundColor:[UIColor UPSecondaryColor]];
    [self.mainScrollView addSubview:self.bigView];
    self.mainScrollView.contentSize=self.bigView.frame.size;
    [self.mainScrollView setBackgroundColor:[UIColor UPSecondaryColor]];
    self.emailBox.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
    self.firstNameBox.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"userFirstName"];
    self.lastNameBox.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"userLastName"];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)didTapSubmit:(id)sender {
    
    Comment *comment= [[Comment alloc] init];
    comment.cwid=[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"];
    comment.commentTitle=self.subjectBox.text;
    comment.email=self.emailBox.text;
    comment.CommentText=self.commentBox.text;
    [UPDataRetrieval submitComment:comment.cwid comment:comment completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addAlertView];
            
        });

        
    }];
    
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)didStartEditingFirst:(id)sender {
    self.navigationItem.rightBarButtonItem=Nil;
}
- (IBAction)didStartEditingLast:(id)sender {
    self.navigationItem.rightBarButtonItem=Nil;
}


-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Comment Sent!" message:@"Your Comment has been sent to our database and a Univeristy Programs representative will review it.\n Thank You." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert show];
}



- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)didTapCancel:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doneButtonOps{
    [self.commentBox resignFirstResponder];
    self.navigationItem.rightBarButtonItem=Nil;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone                                 target:self action:@selector(doneButtonOps)];
    
}


@end
