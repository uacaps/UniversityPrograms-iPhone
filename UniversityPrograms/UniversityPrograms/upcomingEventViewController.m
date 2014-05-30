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
@interface upcomingEventViewController ()

@property NSArray *upcomingArray;

@end

@implementation upcomingEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.upcomingArray = [[NSArray alloc] init];
        self.upcomingArray = @[@"just checking", @"still checking",@"still checking",@"still checking"];
        
        // Custom initialization
        
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
    
}


@end
