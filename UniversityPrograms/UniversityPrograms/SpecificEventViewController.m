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

@interface SpecificEventViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *StartTime;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

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
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
