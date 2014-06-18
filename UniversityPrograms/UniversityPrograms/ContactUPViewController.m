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
#import "AddressTableViewCell.h"
#import "UIColor+UPColors.h"
@interface ContactUPViewController ()

@property NSArray *directoryArray;
@property (weak, nonatomic) IBOutlet UITableView *contactUPTableView;

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

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Comment" style:UIBarButtonItemStyleDone target:self action:@selector(didTouchFeedback)];
    
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [self.contactUPTableView reloadData];
    self.contactUPTableView.backgroundColor=[UIColor getStyleColor];
    self.contactUPTableView.separatorColor = [UIColor getThemeColor];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UI interaction
- (void)didTouchFeedback{
    CommentViewController *newComment = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:newComment animated:YES];
}

#pragma mark - tableview methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.directoryArray.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressTableViewCell"];
        if(!cell){
            cell = [[AddressTableViewCell alloc] init];
        }
        cell.owner = self;
        return cell;
    }
    else {
        DirectoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"directoryCell"];
        if(!cell){
            cell = [[DirectoryTableViewCell alloc] init];
        }
        Employee *e = [self.directoryArray objectAtIndex:indexPath.row-1];
        [cell buildWtihEmployee:e];
        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retVal;
    if (indexPath.row == 0) {
        retVal= AddressTableViewCellHeight;
    }
    else {
        retVal= DirectoryTableViewCellHeight;
    }

    return retVal;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.contactUPTableView reloadData];
}

@end
