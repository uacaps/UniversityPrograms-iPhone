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
@import QuartzCore;
@interface MyUPViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myUPTableView;
@property NSArray *priorCommentArray;

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
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pencil_filled.png"] style:UIBarButtonItemStylePlain target:self action:@selector(didSelectComment)];
    
    
    //self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Add Comment" style:UIBarButtonItemStyleDone target:self action:@selector(didSelectComment)];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -60, self.myUPTableView.frame.size.width, 60)];
    [self.refreshControl addTarget:self action:@selector(loadFeedback) forControlEvents:UIControlEventValueChanged];
    [self.myUPTableView addSubview:self.refreshControl];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [self loadFeedback];
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
            [self.refreshControl endRefreshing];
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
    return self.priorCommentArray.count+2;
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
        tableView.rowHeight=125;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentTitle"];
        
        if(!cell){
            cell = self.commentTitleCell;
        }
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
        
    }
    else{
        
        PriorFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriorCell"];
        
        Comment *c=[self.priorCommentArray objectAtIndex:indexPath.row-2];
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
    else{
        retVal=125.0f;
    }
    return retVal;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        [self didSelectUser];
    }
    else{
        [self.myUPTableView reloadData];
    }
}

@end
