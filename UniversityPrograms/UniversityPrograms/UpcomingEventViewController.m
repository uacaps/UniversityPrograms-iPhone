//
//  upcomingEventViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "UpcomingEventViewController.h"
#import "UpcomingEventsTableViewCell.h"
#import "Colours.h"
#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"
#import "Event.h"
#import "SpecificEventViewController.h"
#import "UIColor+UPColors.h"


@interface UpcomingEventViewController ()

@property NSArray *upcomingArray;
@property UIRefreshControl *refreshControl;
@end

@implementation UpcomingEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Events";
        self.upcomingArray = [[NSArray alloc] init];
        self.tabBarItem.image = [UIImage imageNamed:@"Calendar.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"Calendar_filled.png"];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -60, self.upComingEventsTable.frame.size.width, 60)];
    [self.refreshControl addTarget:self action:@selector(loadEvents) forControlEvents:UIControlEventValueChanged];
    [self.upComingEventsTable addSubview:self.refreshControl];
    
    
    self.upComingEventsTable.backgroundColor = [UIColor getStyleColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    //self.upComingEventsTable.backgroundColor = [UIColor getStyleColor];
    [self loadEvents];
    if(self.child){
        [self.child viewWillAppear:NO];
    }
    //[self.upComingEventsTable reloadData];
    //[self.upComingEventsTable scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
}
#pragma mark - Load data
-(void)loadEvents{
    
    [UPDataRetrieval getEvents:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        

        if(data!=nil){
        
            self.upcomingArray=[NSObject arrayOfType:[Event class] FromJSONData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.networkErrorLabel.alpha=0.0f;
                [self.upComingEventsTable reloadData];
                [self.refreshControl endRefreshing];
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.networkErrorLabel.alpha = 1.0f;
                [self.upComingEventsTable reloadData];
                [self.refreshControl endRefreshing];
            });
        }
        
        
    }];
  
}



#pragma mark - tableview methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.upcomingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView=self.upComingEventsTable;
    Event *e;
    e = [self.upcomingArray objectAtIndex:indexPath.row];
    
    UpcomingEventsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"upcomingCell"];
    
    if(!cell){
        cell = [[UpcomingEventsTableViewCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell buildWithEvent:e];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SpecificEventViewController *tappedEvent = [[SpecificEventViewController alloc] initWithEvent:self.upcomingArray[indexPath.row]];
    self.child = tappedEvent;
    [self.navigationController pushViewController:tappedEvent animated:YES];
    [self.upComingEventsTable reloadData];
}


@end
