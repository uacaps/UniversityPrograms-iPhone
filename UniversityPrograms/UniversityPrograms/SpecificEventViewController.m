//
//  SpecificEventViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "SpecificEventViewController.h"
#import "Event.h"
#import "Colours.h"
#import "UIImageView+WebCache.h"
#import "UserInfoViewController.h"

@interface SpecificEventViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *StartTime;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;

@property (weak, nonatomic) IBOutlet UITextView *DescriptionBox;
@property (weak, nonatomic) IBOutlet UIButton *rsvpButton;


@property Event *specifiedEvent;
@end

@implementation SpecificEventViewController

-(instancetype)initWithEvent:(Event *)event{
    self = [super initWithNibName:NSStringFromClass([SpecificEventViewController class]) bundle:nil];
    if(self){
        self.title=@"Event";
        self.specifiedEvent=event;
        
    }

    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Event";
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://sa.ua.edu/utilities/pages/gallery/galleries/University%20Programs/Movie%20Series/Spiderman/_thumbs/PA1F25C7.jpg"];
    [self.headerImage setImageWithURL:url];
    self.mainScrollView.backgroundColor = [UIColor crimsonColor];
    self.mainScrollView.showsVerticalScrollIndicator=YES;
    self.mainScrollView.scrollEnabled=YES;
    self.mainScrollView.contentSize=CGSizeMake(320,364);
    self.rsvpLabel.alpha=0.0f;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"User Info Not Configured" message:@"Please enter your student information, or at least your CWID, before RSVPing. Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    UserInfoViewController *tempInfoController =[[UserInfoViewController alloc]init];
    [self.navigationController pushViewController:tempInfoController animated:YES];
    
}

- (IBAction)didTapRSVP:(id)sender {
    if([[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]==nil||[[[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]isEqualToString:@""]){
        [self addAlertView];
    }
    else{
        self.rsvpButton.alpha=0.0f;
        self.rsvpLabel.alpha=1.0f;
    }
    
}

@end
