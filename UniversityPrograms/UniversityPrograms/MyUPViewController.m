//
//  MyUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/2/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "MyUPViewController.h"
#import "CommentViewController.h"
#import "UserInfoViewController.h"

#import "Colours.h"
#import "UIColor+UPColors.h"
#import "Comment.h"
#import "MyUPInitTableViewCell.h"
#import "PriorFeedbackTableViewCell.h"
#import "UPDataRetrieval.h"
#import "NSObject+ObjectMap.h"
#import "UIColor+UPColors.h"
#import "UpcomingEventsTableViewCell.h"
#import "SpecificEventViewController.h"
@import QuartzCore;
@interface MyUPViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myUPTableView;
@property NSArray *priorCommentArray;
@property NSArray *unsortedEventArray;
@property NSMutableArray *sortedEventArray;
@property (strong, nonatomic) IBOutlet UITableViewCell *yourEvents;


@property (strong, nonatomic) IBOutlet UITableViewCell *commentTitleCell;
@property UIRefreshControl *refreshControl;
@end

@implementation MyUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"My UP";
    }
    self.tabBarItem.image= [UIImage imageNamed:@"Cog.png"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"Cog_filled.png"];
    self.priorCommentArray=[[NSArray alloc] init];
    self.unsortedEventArray=[[NSArray alloc] init];
    self.sortedEventArray=[[NSMutableArray alloc] init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pencil_filled.png"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectComment)];
    
    
    //self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Add Comment" style:UIBarButtonItemStyleDone target:self action:@selector(didSelectComment)];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -60, self.myUPTableView.frame.size.width, 60)];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.myUPTableView addSubview:self.refreshControl];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [self loadData];
}
-(void)loadData{
    [self loadFeedback];
    [self loadEvents];
    
    [self.refreshControl endRefreshing];
}
-(void)loadEvents{
    [UPDataRetrieval getEvents:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        self.sortedEventArray=[[NSMutableArray alloc] init];
        self.unsortedEventArray=[NSObject arrayOfType:[Event class] FromJSONData:data];
        //NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSArray *sortedArray = [self.unsortedEventArray sortedArrayUsingComparator:^NSComparisonResult(Event *event1, Event *event2) {
            return [event1.startDate compare: event2.startDate];
        }];
        for (int index =0; index<sortedArray.count; ++index) {
            Event *e=[sortedArray objectAtIndex:index];
            if(e.isRegistered==true){
                [self.sortedEventArray addObject:e];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myUPTableView reloadData];
            
        });
        
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectComment{
    CommentViewController *comments = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:comments
                                         animated:YES];
}

-(void)didSelectUser{
    UserInfoViewController *userInfo = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfo animated:YES];
    
}


-(void)loadFeedback{
    [UPDataRetrieval retrieveComments:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        self.priorCommentArray=[NSObject arrayOfType:[Comment class] FromJSONData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myUPTableView reloadData];
            
        });
    }];
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.priorCommentArray.count+self.sortedEventArray.count+3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.row==0){
       MyUPInitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyUPInitCell"];
        if(!cell){
            cell = [[MyUPInitTableViewCell alloc] init];
        }
        [cell  build];
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    }
    else if(indexPath.row==1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yourEvents"];
        if(!cell){
            cell=self.yourEvents;
        }
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
        
    }
    else if(indexPath.row<self.sortedEventArray.count+2){
        UpcomingEventsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"upcomingCell"];
        if(!cell){
            cell=[[UpcomingEventsTableViewCell alloc] init];
        }
        Event *e = [self.sortedEventArray objectAtIndex:indexPath.row-2];
        [cell buildWithEvent:e];
        
        
        return cell;
        
    }
    
    
    else if(indexPath.row==self.sortedEventArray.count+2){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentTitle"];
        
        if(!cell){
            cell = self.commentTitleCell;
        }
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
        
    }
    else{
        
        PriorFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriorCell"];
        
        Comment *c=[self.priorCommentArray objectAtIndex:indexPath.row-self.sortedEventArray.count-3];
        if(!cell){
            cell = [[PriorFeedbackTableViewCell alloc] init];
        }
        [cell buildWithComment:c];
        cell.backgroundColor=[UIColor whiteColor];
        
        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retVal =0.0f;
    if(indexPath.row==0){
        retVal=125.0f;
        
    }
    else if(indexPath.row==1){
        retVal=44.0f;
        
    }
    else if(indexPath.row<self.sortedEventArray.count+2){
       
        retVal=180.0f;
    }
    else if (indexPath.row==self.sortedEventArray.count+2){
        retVal=44.0f;
        
    }
    else{
        retVal=125.0f;
        
    }
    return retVal;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        [self didSelectUser];
    }
    else if (indexPath.row>1 && indexPath.row<self.sortedEventArray.count+2){
        SpecificEventViewController *tappedEvent = [[SpecificEventViewController alloc] initWithEvent:self.sortedEventArray[indexPath.row-2]];
        [self.navigationController pushViewController:tappedEvent animated:YES];
        [self.myUPTableView reloadData];
    }
    else{
        [self.myUPTableView reloadData];
    }
}

@end
