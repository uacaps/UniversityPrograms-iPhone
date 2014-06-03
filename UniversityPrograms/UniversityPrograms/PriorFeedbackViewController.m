//
//  PriorFeedbackViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/3/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "PriorFeedbackViewController.h"
#import "PriorFeedbackTableViewCell.h"

@interface PriorFeedbackViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property NSArray *commentArray;
@property UIRefreshControl *refreshControl;
@end

@implementation PriorFeedbackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Prior Feedback";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -60, self.tableview.frame.size.width, 60)];
    [self.refreshControl addTarget:self action:@selector(loadFeedback) forControlEvents:UIControlEventValueChanged];
    [self.tableview addSubview:self.refreshControl];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadFeedback{
    
    
    [self.tableview reloadData];
    [self.refreshControl endRefreshing];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.commentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tableView=self.tableview;
    PriorFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriorCell"];
    
    if(!cell){
        cell = [[PriorFeedbackTableViewCell alloc] init];
    }
    //cell.eventTitle.text=[self.commentArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableview reloadData];
}

@end
