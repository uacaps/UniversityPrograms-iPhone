//
//  aboutUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AboutUPViewController.h"

@interface AboutUPViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;


@end

@implementation AboutUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"About UP";
        self.tabBarItem.image= [UIImage imageNamed:@"about-32.png"];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainScrollView.showsVerticalScrollIndicator=YES;
    self.mainScrollView.scrollEnabled=YES;
    self.mainScrollView.contentSize=CGSizeMake(320,960);
    self.view.backgroundColor = [UIColor blackColor];
    //[self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
