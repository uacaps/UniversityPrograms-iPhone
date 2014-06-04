//
//  SpecificEventViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "SpecificEventViewController.h"
#import "Colours.h"
#import "UIImageView+WebCache.h"
#import "UserInfoViewController.h"
#import "UIImageView+WebCache.h"
#import "DateTools.h"
#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"

@interface SpecificEventViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (strong, nonatomic) IBOutlet UIView *eventBigView;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventStartTime;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLine1Label;
@property (weak, nonatomic) IBOutlet UILabel *addressLine3Label;
@property (weak, nonatomic) IBOutlet UILabel *addressLine2Label;

@property Event *specifiedEvent;
@end

@implementation SpecificEventViewController

-(instancetype)initWithEvent:(Event *)event{
    self = [super initWithNibName:NSStringFromClass([SpecificEventViewController class]) bundle:nil];
    if(self){
        self.title=@"Event";
        _specifiedEvent = event;
        
    
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
    if(!self.specifiedEvent.isRegistered){
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"RSVP" style:UIBarButtonItemStyleDone target:self action:@selector(didTapRSVP)];
    }
    
    [_mainScrollView addSubview:_eventBigView];
    self.mainScrollView.contentSize = _eventBigView.frame.size;
    
    // Do any additional setup after loading the view from its nib.
    [self getEvent:_specifiedEvent];
    
    
    
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

- (void)didTapRSVP {
    
    if([[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]==nil||[[[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]isEqualToString:@""]){
        [self addAlertView];
    }
    [UPDataRetrieval rsvpEvent:[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"] event:self.specifiedEvent completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[self confirmAlertView];
            self.navigationItem.rightBarButtonItem=nil;
        });
        
    }];
    
    
}
-(void)confirmAlertView{
    UIAlertView *confirmAlert = [[UIAlertView alloc]initWithTitle:@"You have RSVPed" message:@"Your RSVP for this event has been recorded. Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [confirmAlert show];
}

#pragma mark - UI

-(void)setUI{
    //Set image url
    [_eventImageView setImageWithURL:[NSURL URLWithString:_specifiedEvent.imageUrl]];
    _eventTitleLabel.text = _specifiedEvent.eventName;
    _eventDescriptionLabel.text=_specifiedEvent.eventDescription;
    if ([self.specifiedEvent.startDate isLaterThan:[NSDate date]]) {
        int daysFromNow = self.specifiedEvent.startDate.daysUntil;
        if (daysFromNow > 0) {
            self.eventStartTime.text= [NSString stringWithFormat:@"%d days from now", daysFromNow];
            return;
        }
        else {
            int hoursFromNow = self.specifiedEvent.startDate.hoursUntil;
            if (hoursFromNow > 0) {
                self.eventStartTime.text= [NSString stringWithFormat:@"%d days from now", hoursFromNow];
            }
            else {
                int minutesFromNow = self.specifiedEvent.startDate.minutesUntil;
                if (minutesFromNow > 0) {
                    self.eventStartTime.text= [NSString stringWithFormat:@"%d days from now", minutesFromNow];
                }
            }
        }
    }
    //Check for in "happening now" and already done
    else if([self.specifiedEvent.startDate isEarlierThan:[NSDate date]]&&[self.specifiedEvent.endDate isLaterThan:[NSDate date]]){
        self.eventStartTime.text=[NSString stringWithFormat:@"The %@ is happening now",self.specifiedEvent.eventName];
    }
    else{
        self.eventStartTime.text=[NSString stringWithFormat:@"The %@ has already happened", self.specifiedEvent.eventName];
    }
    if(self.specifiedEvent.location.street2==nil){
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@,%@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=addressString;
    }
    else{
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@,%@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=self.specifiedEvent.location.street2;
        self.addressLine3Label.text=addressString;
    }
}

#pragma mark - Webservice

-(void)getEvent:(Event *)event{
    [UPDataRetrieval getSpecificEvent:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] eventID:self.specifiedEvent.eventId completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        self.specifiedEvent=[[Event alloc] initWithJSONData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUI];
        });
        
    }];
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        float offset = scrollView.contentOffset.y;
        
        offset = (offset < 0) ? offset*-0.01 : offset*0.01;
        
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1 + offset, 1 + offset);
        [_eventImageView setTransform:scaleTransform];
    }
}

@end
