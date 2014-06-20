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
#import "SpecificEventViewController.h"
#import "SettingsViewController.h"
@import QuartzCore;


@interface MyUPViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myUPTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *yourEvents;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectorControl;
@property (strong, nonatomic) IBOutlet UITableViewCell *commentTitleCell;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cwidLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myUPImage;
@property (weak, nonatomic) IBOutlet UIView *dividerView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIView *secondDividerView;
@property NSArray *priorCommentArray;
@property NSArray *unsortedEventArray;
@property NSMutableArray *sortedEventArray;
@property UIRefreshControl *refreshControl;

@property BOOL controlFlag;
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
    self.controlFlag=YES;
    

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle: @"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(didSelectSettings)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Comment" style:UIBarButtonItemStyleDone target:self action:@selector(didSelectComment)];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -60, self.myUPTableView.frame.size.width, 60)];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.myUPTableView addSubview:self.refreshControl];
    self.selectorControl.tintColor = [UIColor getThemeColor];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
    [self build];
    [self.selectorControl setEnabled:YES forSegmentAtIndex:0];
    
    [self.myUPTableView scrollRectToVisible:CGRectMake(0, 0, 320, 125) animated:NO];
}

- (IBAction)didTapEdit:(id)sender {
    UserInfoViewController *userinfo = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userinfo animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - data loading
-(void)loadData{
    
    [self loadEvents];
    //[self loadFeedback];
    [self.refreshControl endRefreshing];
}
-(void)loadEvents{
    [UPDataRetrieval getEvents:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        if(data!=nil){
        
            self.sortedEventArray=[[NSMutableArray alloc] init];
            self.unsortedEventArray=[NSObject arrayOfType:[Event class] FromJSONData:data];
            //NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            for (int index =0; index<self.unsortedEventArray.count; ++index) {
                Event *e=[self.unsortedEventArray objectAtIndex:index];
                if(e.isRegistered==true){
                    [self.sortedEventArray addObject:e];
                }
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myUPTableView reloadData];
            
        });
        [self loadFeedback];
        
    }];
    
    
}
-(void)loadFeedback{
    [UPDataRetrieval retrieveComments:[[NSUserDefaults standardUserDefaults] valueForKey:@"cwid"] completetionHandler:^(NSURLResponse *response, NSData *data, NSError *e) {
        if(data!=nil){
            self.priorCommentArray=[NSObject arrayOfType:[Comment class] FromJSONData:data];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myUPTableView reloadData];
            
        });
        
    }];
    
}
-(void)build{
    UIColor *styleColor = [UIColor getStyleColor];
    UIColor *textColor = [UIColor getTextColor];
    UIColor *themeColor = [UIColor getThemeColor];
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"] isEqualToString:@""]||[[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"] ==nil){}
    else{
        self.firstNameLabel.text= [[NSUserDefaults standardUserDefaults] stringForKey:@"userFirstName"];
        self.lastNameLabel.text= [[NSUserDefaults standardUserDefaults] stringForKey:@"userLastName"];
        self.cwidLabel.text= [[NSUserDefaults standardUserDefaults] stringForKey:@"cwid"];
        self.emailLabel.text= [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
        
    }
    self.myUPTableView.separatorColor = [UIColor getThemeColor];
    self.cwidLabel.textColor = textColor;
    self.emailLabel.textColor = textColor;
    self.firstNameLabel.textColor = themeColor;
    self.lastNameLabel.textColor = themeColor;
    self.myUPImage.image=[UIImage imageNamed:@"UP.jpg"];
    self.emailLabel.backgroundColor=styleColor;
    self.lastNameLabel.backgroundColor=styleColor;
    self.firstNameLabel.backgroundColor=styleColor;
    self.cwidLabel.backgroundColor=styleColor;
    self.selectorControl.tintColor = themeColor;
    self.view.backgroundColor = styleColor;
    self.selectorControl.backgroundColor = styleColor;
    self.myUPTableView.backgroundColor = styleColor;
    self.myUPImage.backgroundColor = styleColor;
    
    self.myUPImage.layer.cornerRadius=self.myUPImage.frame.size.width/2;
    self.dividerView.backgroundColor = themeColor;
    self.secondDividerView.backgroundColor = themeColor;
    self.editButton.tintColor = styleColor;
    self.editButton.backgroundColor = themeColor;
    self.editButton.layer.cornerRadius=12;
    
}


#pragma mark - UI interactions

- (IBAction)changedCategories:(id)sender {
    self.controlFlag= !self.controlFlag;
    [self.myUPTableView reloadData];
    [self.myUPTableView scrollRectToVisible:CGRectMake(0, 0, 320, 125) animated:NO];
}
-(void)didSelectComment{
    CommentViewController *comments = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:comments
                                         animated:YES];
}

-(void)didSelectSettings{
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settings animated:YES];
    
}

#pragma mark - UI tableview methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(self.controlFlag){
        return self.sortedEventArray.count;
    }
    else{
        return self.priorCommentArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.controlFlag){
        MyUPInitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyUPInitCell"];
        if(!cell){
            cell=[[MyUPInitTableViewCell alloc] init];
        }
        Event *e = [self.sortedEventArray objectAtIndex:indexPath.row];
        [cell buildWithEvent:e];
        return cell;
    }
    else{
        PriorFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriorCell"];
        Comment *c=[self.priorCommentArray objectAtIndex:indexPath.row];
        if(!cell){
            cell = [[PriorFeedbackTableViewCell alloc] init];
        }
        [cell buildWithComment:c];
        
        return cell;

    }
    
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retVal =0.0f;
     if(self.controlFlag){
         retVal=MyUPTableViewCellHeight;
     }
     else{
         retVal= [PriorFeedbackTableViewCell heightForComment:self.priorCommentArray[indexPath.row]]; //Comments
     }
   
    return retVal;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.controlFlag){
        SpecificEventViewController *tappedEvent = [[SpecificEventViewController alloc] initWithEvent:self.sortedEventArray[indexPath.row]];
        [self.navigationController pushViewController:tappedEvent animated:YES];
        [self.myUPTableView reloadData];
    }
    else{
        [self.myUPTableView reloadData];
    }
}

@end
