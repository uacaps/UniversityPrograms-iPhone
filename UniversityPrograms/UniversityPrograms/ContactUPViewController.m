//
//  ContactUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 6/5/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "ContactUPViewController.h"
#import "DirectoryTableViewCell.h"
#import "CommentViewController.h"
#import "Employee.h"
@interface ContactUPViewController ()

@property NSArray *directoryArray;
@property (weak, nonatomic) IBOutlet UITableView *contactUPTableView;

@property (strong, nonatomic) IBOutlet UITableViewCell *addressCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *directoryHeaderCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *sendFeedbackCell;


@end

@implementation ContactUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Contact UP";
        self.tabBarItem.image=[UIImage imageNamed:@"Contact.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"Contact_filled.png"];
        
        self.directoryArray=[Employee buildArrayOfEmployees];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return self.directoryArray.count+3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sendFeedbackCell"];
        
        if(!cell){
            cell = self.sendFeedbackCell;
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
        
        
    }
    else if(indexPath.row==1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressCell"];
        
        if(!cell){
            cell = self.addressCell;
        }
        return cell;
        
    }
    else if(indexPath.row==2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"directoryHeaderCell"];
    
        if(!cell){
            cell = self.directoryHeaderCell;
        }
        return cell;
    }
    else{
        DirectoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"directoryCell"];
        
        if(!cell){
            cell = [[DirectoryTableViewCell alloc] init];
        }
        Employee *e = [self.directoryArray objectAtIndex:indexPath.row-3];
        [cell buildWtihEmployee:e];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retVal =0.0f;
    if(indexPath.row==1){
        retVal=120.0f;
        
    }
    else if(indexPath.row>2){
        retVal=122.0f;
        
    }
    else{
        retVal=44.0f;
        
    }
    
    return retVal;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){CommentViewController *tappedEvent = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:tappedEvent animated:YES];
        [self.contactUPTableView reloadData];}
    else {[self.contactUPTableView reloadData];}
}

@end
