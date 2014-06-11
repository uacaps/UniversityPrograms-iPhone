//
//  SpecificEventViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "SpecificEventViewController.h"
#import "Colours.h"
#import "UIColor+UPColors.h"
#import "UIImageView+WebCache.h"
#import "UserInfoViewController.h"
#import "DateTools.h"
#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"

@interface SpecificEventViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UILabel *attendingLabel;
@property (strong, nonatomic) IBOutlet UIView *eventBigView;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventStartTime;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLine1Label;
@property (weak, nonatomic) IBOutlet UILabel *addressLine3Label;
@property (weak, nonatomic) IBOutlet UILabel *addressLine2Label;
@property (weak, nonatomic) IBOutlet UIView *bodyView;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIView *divider;
@property BOOL firstLoad;
@property Event *specifiedEvent;
@end

@implementation SpecificEventViewController

-(instancetype)initWithEvent:(Event *)event{
    self = [super initWithNibName:NSStringFromClass([SpecificEventViewController class]) bundle:nil];
    if(self){
        self.title=@"Event";
        
        self.specifiedEvent = event;
        self.firstLoad=YES;
    
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
    [self.loadingIndicator startAnimating];
    [self.mainScrollView addSubview:self.eventBigView];
    self.mainScrollView.contentSize =self.eventBigView.frame.size;
    [self getEvent:self.specifiedEvent];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    if(self.firstLoad){
        self.firstLoad=!self.firstLoad;
    }
    else{
        [self getEvent:self.specifiedEvent];
    }
    [self setUI];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - alert methods
-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"User Info Not Configured" message:@"Please enter your student information, or at least your CWID, before RSVPing. Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert setTag:1];
    [saveAlert show];
    
    
}

-(void)addUnRSVPAlertView{
    UIAlertView *unAlert = [[UIAlertView alloc] initWithTitle:@"un-RSVPed" message:@"You have un-RSVPed from this event, we hope to see you at other future events." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [unAlert setTag:10];
    [unAlert show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==1){
        UserInfoViewController *tempInfoController =[[UserInfoViewController alloc]init];
        [self.navigationController pushViewController:tempInfoController animated:YES];
    }
    
}

-(void)confirmAlertView{
    UIAlertView *confirmAlert = [[UIAlertView alloc]initWithTitle:@"You have RSVPed" message:@"Your RSVP for this event has been recorded. Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [confirmAlert setTag:2];
    [confirmAlert show];
    
}

#pragma mark - UI
+(CGFloat)heightForEvent:(Event *)event{
    float textHeight = [event.description boundingRectWithSize:CGSizeMake(280,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:14.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    return textHeight + 320;
}

-(void)setUI{
    //set bar button type
    
    self.eventTitleLabel.textColor = [UIColor getThemeColor];
    self.addressLine1Label.textColor = [UIColor getTextColor];
    self.addressLine2Label.textColor = [UIColor getTextColor];
    self.addressLine3Label.textColor = [UIColor getTextColor];
    self.eventDescriptionLabel.textColor=[UIColor getTextColor];
    self.eventBigView.backgroundColor = [UIColor getStyleColor];
    self.bodyView.backgroundColor = [UIColor getStyleColor];
    self.footerView.backgroundColor=[UIColor getStyleColor];
    self.eventDescriptionLabel.backgroundColor = [UIColor getStyleColor];
    self.addressLine1Label.backgroundColor = [UIColor getStyleColor];
    self.addressLine2Label.backgroundColor = [UIColor getStyleColor];
    self.addressLine3Label.backgroundColor = [UIColor getStyleColor];
    self.divider.backgroundColor = [UIColor getTextColor];
    if(!self.specifiedEvent.isRegistered){
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"RSVP" style:UIBarButtonItemStyleDone target:self action:@selector(didTapRSVP)];
    }
    else{
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"RSVP" style:UIBarButtonItemStyleDone target:self action:@selector(didTapUnRSVP)];
        self.navigationItem.rightBarButtonItem.tintColor=[UIColor getThemeColor];
    }
    //Set image url
    [self.eventImageView setImageWithURL:[NSURL URLWithString:self.specifiedEvent.imageUrl]];
    self.eventTitleLabel.text = self.specifiedEvent.eventName;
    self.eventTitleLabel.backgroundColor = [UIColor getStyleColor];
    self.eventDescriptionLabel.text=self.specifiedEvent.eventDescription;
    if(self.specifiedEvent.isRegistered){
        self.attendingLabel.text=@"You are attending";
        
    }
    else{

        if(self.specifiedEvent.numberAttending==[NSNumber numberWithInt:1]){
            self.attendingLabel.text=[NSString stringWithFormat:@"%@ person is attending", [self.specifiedEvent.numberAttending stringValue]];
        }
        else if(self.specifiedEvent.numberAttending==[NSNumber numberWithInt:0]){
            self.attendingLabel.text=@"";
        }
        
        else{
            self.attendingLabel.text=[NSString stringWithFormat:@"%@ people are attending", [self.specifiedEvent.numberAttending stringValue]];
        }
    }
    if(self.specifiedEvent.location==nil){
        self.addressLine1Label.text=@"";
        self.addressLine2Label.text=@"";
        self.addressLine3Label.text=@"";
    }
    
    else if(self.specifiedEvent.location.street2==nil){
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@, %@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=addressString;
    }
    else{
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@, %@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=self.specifiedEvent.location.street2;
        self.addressLine3Label.text=addressString;
    }
    
    if ([self.specifiedEvent.startDate isLaterThan:[NSDate date]]) {
        int daysFromNow = self.specifiedEvent.startDate.daysUntil;
        if (daysFromNow > 0) {
            if(daysFromNow ==1){
                self.eventStartTime.text = [NSString stringWithFormat:@"%d day from now", daysFromNow];
            }
            else{
                self.eventStartTime.text= [NSString stringWithFormat:@"%d days from now", daysFromNow];
            }
        }
        else {
            int hoursFromNow = self.specifiedEvent.startDate.hoursUntil;
            if (hoursFromNow > 0) {
                self.eventStartTime.text= [NSString stringWithFormat:@"%d hours from now", hoursFromNow];
                
            }
            else {
                int minutesFromNow = self.specifiedEvent.startDate.minutesUntil;
                if (minutesFromNow > 0) {
                    self.eventStartTime.text= [NSString stringWithFormat:@"%d minutes from now", minutesFromNow];
                    
                }
            }
        }
    }
    //Check for in "happening now" and already done
    else if([self.specifiedEvent.startDate isEarlierThan:[NSDate date]]&&[self.specifiedEvent.endDate isLaterThan:[NSDate date]]){
        self.eventStartTime.text=[NSString stringWithFormat:@"Happening Now"];
    }
    else{
        self.eventStartTime.text=[NSString stringWithFormat:@"Already Happened"];
    }
    float textHeight = [self.specifiedEvent.eventDescription boundingRectWithSize:CGSizeMake(220,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:14.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    //Set frame sizes
    self.eventDescriptionLabel.frame = CGRectMake(self.eventDescriptionLabel.frame.origin.x, self.eventDescriptionLabel.frame.origin.y, self.eventDescriptionLabel.frame.size.width, textHeight);
    self.eventBigView.frame = CGRectMake(0, 0, self.eventBigView.frame.size.width, 430 + textHeight);
    self.mainScrollView.contentSize=self.eventBigView.frame.size;
    [self.loadingIndicator stopAnimating];
    self.mainScrollView.backgroundColor = [UIColor getStyleColor];
    
}

#pragma mark - Webservice

-(void)getEvent:(Event *)event{
    [UPDataRetrieval getSpecificEvent:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] eventID:self.specifiedEvent.eventId completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        //NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        self.specifiedEvent=[[Event alloc] initWithJSONData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUI];
        });
        
    }];
}
- (void)didTapRSVP {
    
    if([[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]==nil||[[[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"]isEqualToString:@""]){
        [self addAlertView];
    }
    else{
        [UPDataRetrieval rsvpEvent:[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"] event:self.specifiedEvent completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self confirmAlertView];
                [self.loadingIndicator startAnimating];
                [self getEvent:self.specifiedEvent];
                
            });
            
        }];
    }
    
}
-(void)didTapUnRSVP{
    [UPDataRetrieval unrsvp:[[NSUserDefaults standardUserDefaults]stringForKey:@"cwid"] event:self.specifiedEvent completetionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addUnRSVPAlertView];
            [self getEvent:self.specifiedEvent];
            
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
        [self.eventImageView setTransform:scaleTransform];
    }
}

@end
