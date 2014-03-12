//
//  TiesMainViewController.m
//  Ties
//
//  Created by peng wan on 2/17/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesMainViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TiesTransitions.h"
#import "TiesLoginViewController.h"
#import "TiesHeaderViewController.h"
#import <AFNetworking/AFHTTPClient.h>
#import "UIImageView+AFNetworking.h"
#import "TiesUser.h"
#import "TiesPostTableViewCell.h"

@interface TiesMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) NSArray *postArray;
@property (nonatomic,weak) NSString *postCategory;
@end

@implementation TiesMainViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self downloadPostforPage:1 andPageSize:1];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleImageWithName:@"logo.png" atX:126 Y:0 width:67 andHeight:44];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.postArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mainViewCell";
    TiesPostTableViewCell *cell = (TiesPostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!self.postArray.count) {
        return cell;
    }
    // Configure the cell...
    NSDictionary *postDic = (NSDictionary *)[self.postArray objectAtIndex:indexPath.row];
    NSString *picURL = [postDic objectForKey:@"pic"];
    cell.imageURL = picURL;
    cell.subtitle.text = [postDic objectForKey:@"title"];
    cell.cityState.text = [NSString stringWithFormat:@"%@, %@",[postDic objectForKey:@"city"], [postDic objectForKey:@"state"]];
    switch (indexPath.row) {
        case 0:
            cell.label.text = @"Lets do Coffee";
            [[TiesUser getInstance] setPostCategory:@"Coffee"];
            break;
            
            case 1:
            cell.label.text = @"Lets do Breakfast";
            [[TiesUser getInstance] setPostCategory:@"Breakfast"];
            break;
            
        case 2:
            cell.label.text = @"Lets do Lunch";
            [[TiesUser getInstance] setPostCategory:@"Lunch"];
            break;
            
        case 3:
            cell.label.text = @"Lets do Dinner";
            [[TiesUser getInstance] setPostCategory:@"Dinner"];
            break;
            
        default:
            break;
    }
    
    [cell drawRect:cell.frame];
    return cell;
}

-(void) downloadPostforPage: (NSInteger) pageNumber andPageSize: (NSInteger)pageSize
{
    
    //Get the post for launch screen
    AFHTTPClient *client = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:@"http://198.100.174.21/"]];
    NSString *getPath = [NSString stringWithFormat:@"http://198.100.174.21/post/"];
    
    [client getPath:getPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseOject) {
        
        NSError *e = nil;
        NSDictionary *json = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:responseOject options:NSJSONReadingMutableContainers error:&e];
                
        self.postArray = [[NSArray alloc]init];
        
        self.postArray = [json objectForKey:@"list"];
        if (self.postArray.count) {
            [self.mainTableView reloadData];
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        
    }];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 320;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
