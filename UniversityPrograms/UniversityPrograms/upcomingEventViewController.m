//
//  upcomingEventViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "upcomingEventViewController.h"
#import "upcomingEventsTableViewCell.h"
#import "Colours.h"
#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"
#import "Event.h"
#import "SpecificEventViewController.h"
@interface upcomingEventViewController ()

@property NSArray *upcomingArray;

@end

@implementation upcomingEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Upcoming Events";
        self.upcomingArray = [[NSArray alloc] init];
        self.upcomingArray = @[@"just checking", @"still checking",@"still checking",@"still checking"];
        //[self loadEvents];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.upComingEventsTable.backgroundColor = [UIColor charcoalColor];
    self.upComingEventsTable.separatorColor = [UIColor charcoalColor];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)loadEvents{
    [UPDataRetrieval getEvents:[[NSUserDefaults standardUserDefaults] valueForKey:@"setCWID"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        _upcomingArray=[NSObject arrayOfType:[Event class] FromJSONData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.upComingEventsTable reloadData];
            
        });
    }];
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
    return self.upcomingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView=self.upComingEventsTable;
    upcomingEventsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"upcomingCell"];
    
    if(!cell){
        cell = [[upcomingEventsTableViewCell alloc] init];
    }
    cell.eventTitle.text=[self.upcomingArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SpecificEventViewController *tappedEvent = [[SpecificEventViewController alloc] init];
    [self.navigationController pushViewController:tappedEvent animated:YES];
    [self.upComingEventsTable reloadData];
}


@end
