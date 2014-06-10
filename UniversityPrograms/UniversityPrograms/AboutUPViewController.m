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
@property (strong, nonatomic) IBOutlet UITableViewCell *whatWeDo;
@property (strong, nonatomic) IBOutlet UITableViewCell *whoWeAre;
@property (strong, nonatomic) IBOutlet UITableViewCell *getInvolvedHeader;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property NSArray *getInvolvedArray;
@end

@implementation AboutUPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"About UP";
        self.tabBarItem.image= [UIImage imageNamed:@"Info.png"];
        self.tabBarItem.selectedImage= [UIImage imageNamed:@"Info_filled.png"];
        self.getInvolvedArray=[GetInvolvedCellData buildArrayOfDefaultData];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    //[self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view from its nib.

}
-(void)viewDidAppear:(BOOL)animated{
    self.headerLabel.backgroundColor=[UIColor getThemeColor];
    //[self.aboutTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
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
    return self.getInvolvedArray.count+3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        
    
        UITableViewCell *cell = self.whatWeDo;
        return cell;
    }
    else if(indexPath.row==1){
        UITableViewCell *cell = self.whoWeAre;
        return cell;
    }
    else if(indexPath.row==2){
        UITableViewCell *cell = self.getInvolvedHeader;
        return cell;
    }
    else{
        GetInvolvedCellData *data=[self.getInvolvedArray objectAtIndex:indexPath.row-3];
        
        GetInvolvedTableViewCell *cell = [[GetInvolvedTableViewCell alloc]init];
        cell.titleLabel.text = data.title;
        cell.bodyTextLabel.text = data.text;
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
        retVal=220.0f;//who we are and what we do cell height
        
    }
    else if(indexPath.row==2){
        retVal=44.0f;//header cell height
        
    }
    else{
        retVal= [GetInvolvedTableViewCell heightForData:[self.getInvolvedArray objectAtIndex:indexPath.row-3]];
        
    }
    
    return retVal;
    
}

@end
