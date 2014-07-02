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
#import <Social/Social.h>

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
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
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
    self.view.backgroundColor = [UIColor getStyleColor];
}
-(void)updateViews{
    if(self.firstLoad){
        self.firstLoad=!self.firstLoad;
    }
    else{
        [self getEvent:self.specifiedEvent];
    }
    [self setUI];
    self.view.backgroundColor = [UIColor getStyleColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - alert methods
-(void)addAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"User Info Not Configured" message:@"Please enter your student information before RSVPing. Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert setTag:1];
    [saveAlert show];
    
    
}
-(void)failureAlertView{
    UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Failed to Send Message" message:@"Failed to send RSVP message to server due to network problems. Please try again at another time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [saveAlert setTag:404];
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
    float textHeight = [event.eventDescription boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    return textHeight + 448;
}

-(void)setUI{
    //set colors
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *themeColor = [UIColor getThemeColor];
    UIColor *textColor = [UIColor getTextColor];
    
    self.eventTitleLabel.textColor = themeColor;
    self.dateLabel.textColor=textColor;
    self.divider.backgroundColor = textColor;
    self.addressLine1Label.textColor = textColor;
    self.addressLine2Label.textColor = textColor;
    self.addressLine3Label.textColor = textColor;
    self.eventDescriptionLabel.textColor=textColor;
    self.loadingIndicator.backgroundColor = styleColor;
    self.loadingIndicator.tintColor = themeColor;
    self.eventBigView.backgroundColor = styleColor;
    self.bodyView.backgroundColor = styleColor;
    self.footerView.backgroundColor=styleColor;
    self.eventDescriptionLabel.backgroundColor = styleColor;
    self.addressLine1Label.backgroundColor = styleColor;
    self.addressLine2Label.backgroundColor = styleColor;
    self.addressLine3Label.backgroundColor = styleColor;
    self.dateLabel.backgroundColor = styleColor;
    self.mainScrollView.backgroundColor = styleColor;
    [self.tweetButton setImage:[UIImage imageNamed:@"Twitter_filled"] forState:UIControlStateHighlighted];
    [self.facebookButton setImage:[UIImage imageNamed:@"Facebook_filled"] forState:UIControlStateHighlighted];
    if(!self.specifiedEvent.isRegistered){
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"RSVP" style:UIBarButtonItemStyleDone target:self action:@selector(didTapRSVP)];
    }
    else{
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"RSVP" style:UIBarButtonItemStyleDone target:self action:@selector(didTapUnRSVP)];
        self.navigationItem.rightBarButtonItem.tintColor=themeColor;
    }
    
    
    
    //Set image url
    [self.eventImageView setImageWithURL:[NSURL URLWithString:self.specifiedEvent.imageUrl]];
    self.eventTitleLabel.text = self.specifiedEvent.eventName;
    self.eventTitleLabel.backgroundColor = styleColor;
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
    
    
    //format the address labels
    if(self.specifiedEvent.location==nil){
        self.addressLine1Label.text=@"";
        self.addressLine2Label.text=@"";
        self.addressLine3Label.text=@"";
    }
    
    else if(self.specifiedEvent.location.street2==nil){
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@, %@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=addressString;
        if(self.specifiedEvent.location.roomNumber){
            self.addressLine3Label.text = self.specifiedEvent.location.roomNumber;
        }
        else{
            self.addressLine3Label.text=@"";
        }
    }
    else{
        self.addressLine1Label.text=self.specifiedEvent.location.street1;
        NSString *addressString = [[NSString alloc] initWithFormat:@"%@, %@ %@", self.specifiedEvent.location.city, self.specifiedEvent.location.state, self.specifiedEvent.location.zip ];
        self.addressLine2Label.text=addressString;
        if(self.specifiedEvent.location.roomNumber){
            self.addressLine3Label.text = self.specifiedEvent.location.roomNumber;
        }
        else{
            self.addressLine3Label.text=@"";
        }
    }
    
    
    //correctly format the days until label
    if ([self.specifiedEvent.startDate isLaterThan:[NSDate date]]) {
        NSInteger daysFromNow = self.specifiedEvent.startDate.daysUntil;
        if (daysFromNow > 0) {
            if(daysFromNow ==1){
                self.eventStartTime.text = [NSString stringWithFormat:@"%ld day from now", (long)daysFromNow];
            }
            else{
                self.eventStartTime.text= [NSString stringWithFormat:@"%ld days from now", (long)daysFromNow];
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
    
    
    
    
    //dynamic cell size
    float textHeight = [self.specifiedEvent.eventDescription boundingRectWithSize:CGSizeMake(300,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:15.0]} context:nil].size.height;
    textHeight = ceilf(textHeight);
    
    
    
    
    //Set frame sizes
    self.eventDescriptionLabel.frame = CGRectMake(self.eventDescriptionLabel.frame.origin.x, self.eventDescriptionLabel.frame.origin.y, self.eventDescriptionLabel.frame.size.width, textHeight);
    self.eventBigView.frame = CGRectMake(0, 0, self.eventBigView.frame.size.width, [SpecificEventViewController heightForEvent:self.specifiedEvent]);
    self.mainScrollView.contentSize=self.eventBigView.frame.size;
    [self.loadingIndicator stopAnimating];
    //set date label
    self.dateLabel.text=[NSString stringWithFormat:@"%@ → %@",[self.specifiedEvent.startDate formattedDateWithFormat:@"MMM dd, hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]],[self.specifiedEvent.endDate formattedDateWithFormat:@"hh:mm a" timeZone:[NSTimeZone timeZoneWithName:@"CST"]]];
    
}

#pragma mark - Webservice
- (IBAction)didTweet:(id)sender {
    SLComposeViewController *composeTweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [composeTweet setInitialText:[NSString stringWithFormat:@"I am attending %@ hosted by @UAwhatsUP on %@, you should too!", self.specifiedEvent.eventName,[self.specifiedEvent.endDate formattedDateWithFormat:@"MMM dd" timeZone:[NSTimeZone timeZoneWithName:@"CST"]]]];
    
    [self presentViewController:composeTweet animated:YES completion:^{
        
    }];
    
}
- (IBAction)didTapFacebook:(id)sender {
    SLComposeViewController *composeTweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [composeTweet setInitialText:[NSString stringWithFormat:@"I am attending %@ hosted by University Programs on %@, you should too!", self.specifiedEvent.eventName,[self.specifiedEvent.endDate formattedDateWithFormat:@"MMM dd" timeZone:[NSTimeZone timeZoneWithName:@"CST"]]]];
    
    [self presentViewController:composeTweet animated:YES completion:^{
        
    }];
}
-(void)getEvent:(Event *)event{
    [UPDataRetrieval getSpecificEvent:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] eventID:self.specifiedEvent.eventId completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        //NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        if(data!=nil){
            self.specifiedEvent=[[Event alloc] initWithJSONData:data];
        }
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
            
            NSString *responseCode = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            //NSLog(@"%@", responseCode);
            if([responseCode isEqualToString:@"true"]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self confirmAlertView];
                    [self.loadingIndicator startAnimating];
                    [self getEvent:self.specifiedEvent];
                    
                });
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self failureAlertView];
                    [self.loadingIndicator startAnimating];
                    [self getEvent:self.specifiedEvent];
                    
                });
            }
            
            
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
