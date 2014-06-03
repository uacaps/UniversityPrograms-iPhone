//
//  commentViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "commentViewController.h"
#import "UPDataRetrieval.h"
#import "Colours.h"
#import "Comment.h"
#import "NSObject+ObjectMap.h"

@interface commentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *subjectBox;
@property (weak, nonatomic) IBOutlet UITextField *emailBox;
@property (weak, nonatomic) IBOutlet UITextView *commentBox;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

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
    self.mainScrollView.showsVerticalScrollIndicator=YES;
    self.mainScrollView.scrollEnabled=YES;
    self.mainScrollView.contentSize=CGSizeMake(320,444);
    //self.commentBox.layer.borderWidth=2.0f;
    //self.commentBox.layer.borderColor=[[UIColor grayColor]CGColor];
    self.emailBox.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)didTapSubmit:(id)sender {
    [self addAlertView];
    Comment *comment= [[Comment alloc] init];
    comment.CWID=[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"];
    comment.Title=self.subjectBox.text;
    comment.email=self.emailBox.text;
    comment.CommentText=self.commentBox.text;
    [UPDataRetrieval submitComment:comment.CWID comment:comment completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        [self addAlertView];
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
    //self.commentBox.text=@"";
    [self.commentBox resignFirstResponder];
    self.navigationItem.rightBarButtonItem=Nil;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonOps)];
    
}


@end
