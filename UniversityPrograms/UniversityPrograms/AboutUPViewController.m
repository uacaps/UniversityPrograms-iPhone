//
//  aboutUPViewController.m
//  UniversityPrograms
//
//  Created by Miles Crabbe on 5/30/14.
//  Copyright (c) 2014 CAPS. All rights reserved.
//

#import "AboutUPViewController.h"
#import "UIColor+UPColors.h"
#import "GetInvolvedCellData.h"
#import "GetInvolvedTableViewCell.h"
@interface AboutUPViewController ()

@property (weak, nonatomic) IBOutlet UITableView *aboutTableView;

@property NSArray *getInvolvedArray;
@end

@implementation AboutUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{   // Custom initialization
    if (self) {
        self.title=@"About UP";
        self.tabBarItem.image= [UIImage imageNamed:@"Info.png"];
        self.tabBarItem.selectedImage= [UIImage imageNamed:@"Info_filled.png"];
        self.getInvolvedArray=[GetInvolvedCellData buildArrayOfDefaultData];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.aboutTableView reloadData];
    self.aboutTableView.backgroundColor = [UIColor getStyleColor];
    [self.aboutTableView scrollRectToVisible:CGRectMake(0, 0, 320, 140) animated:NO];
    //self.aboutTableView.separatorColor = [UIColor getThemeColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableview methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.getInvolvedArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row<2){
        GetInvolvedCellData *data=[self.getInvolvedArray objectAtIndex:indexPath.row];
        GetInvolvedTableViewCell *cell = [[GetInvolvedTableViewCell alloc]init];
        [cell buildWithData:data];
        return cell;
    }
    /*
    else if(indexPath.row==2){
        UITableViewCell *cell = self.getInvolvedHeader;
        self.headerLabel.backgroundColor=[UIColor getThemeColor];
        return cell;
    }
     */
    else{
        GetInvolvedCellData *data=[self.getInvolvedArray objectAtIndex:indexPath.row];
        GetInvolvedTableViewCell *cell = [[GetInvolvedTableViewCell alloc]init];
        [cell buildWithData:data];
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
        retVal=[GetInvolvedTableViewCell heightForData:[self.getInvolvedArray objectAtIndex:indexPath.row]];//who we are and what we do cell height
        
    }
    /*
    else if(indexPath.row==2){
        retVal=44.0f;//header cell height
        
    }
     */
    else{
        retVal= [GetInvolvedTableViewCell heightForData:[self.getInvolvedArray objectAtIndex:indexPath.row]];
        
    }
    
    return retVal;
    
}

@end
