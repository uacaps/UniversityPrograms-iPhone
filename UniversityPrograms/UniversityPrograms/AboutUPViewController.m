//
//  aboutUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AboutUPViewController.h"
#import "UIColor+UPColors.h"
@interface AboutUPViewController ()

@property (weak, nonatomic) IBOutlet UITableView *aboutTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *whatWeDo;
@property (strong, nonatomic) IBOutlet UITableViewCell *whoWeAre;
@property (strong, nonatomic) IBOutlet UITableViewCell *getInvolvedHeader;

@end

@implementation AboutUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"About UP";
        self.tabBarItem.image= [UIImage imageNamed:@"Info.png"];
        self.tabBarItem.selectedImage= [UIImage imageNamed:@"Info_filled.png"];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    //[self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        
    
        UITableViewCell *cell = self.whatWeDo;
        return cell;
    }
    else if(indexPath.row==1){
        UITableViewCell *cell = self.whoWeAre;
        return cell;
    }
    else{
        UITableViewCell *cell = self.getInvolvedHeader;
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.aboutTableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retVal =0.0f;
    if(indexPath.row<2){
        retVal=220.0f;
        
    }
    else if(indexPath.row==2){
        retVal=44.0f;
        
    }
    else{
        retVal=44.0f;
        
    }
    
    return retVal;
    
}

@end
