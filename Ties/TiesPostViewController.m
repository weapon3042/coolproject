//
//  TiesPostViewController.m
//  Ties
//
//  Created by Kelvin Lam on 2/22/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesPostViewController.h"
#import "TiesTransitions.h"
#import "TiesLoginViewController.h"
#import "TiesHeaderViewController.h"
#import <AFNetworking/AFHTTPClient.h>
#import "UIImageView+AFNetworking.h"
#import "TiesUser.h"

@interface TiesPostViewController ()
@property (weak, nonatomic) IBOutlet UITableView *postTableV;
@property (nonatomic, strong) NSArray *postArray;

@end

@implementation TiesPostViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self downloadPostforPage:1 andPageSize:20];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleImageWithName:@"post_title.png" atX:134 Y:11 width:52 andHeight:22];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    
    static NSString *CellIdentifier = @"postCell";
    UITableViewCell *cell = [self.postTableV dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
    if (!self.postArray.count) {
        return cell;
    }
    
    // Configure the cell...
    NSDictionary *postDic = (NSDictionary *)[self.postArray objectAtIndex:indexPath.row];
    NSString *picURL = [postDic objectForKey:@"pic"];
    UIImageView *postImg = [[UIImageView alloc]init];
    postImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:picURL]]];
    postImg.frame = CGRectMake(0, 0, 320, 320);
    [postImg setImageWithURL:[NSURL URLWithString:picURL] placeholderImage:nil];
    [cell.contentView addSubview:postImg];
    
    
    UIView *subtitleV = [[UIView alloc]initWithFrame:CGRectMake(0, 280, 320, 40)];
    subtitleV.backgroundColor = [UIColor colorWithRed:49/255 green:51/255 blue:55/255 alpha:0.4];
    [cell.contentView addSubview:subtitleV];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 320, 20)];
    title.text = [postDic objectForKey:@"title"];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont boldSystemFontOfSize:14];
    [cell.contentView addSubview:title];
    
    UILabel *cityState = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 320, 20)];
    cityState.text = [NSString stringWithFormat:@"%@, %@",[postDic objectForKey:@"city"], [postDic objectForKey:@"state"]];
    cityState.textColor = [UIColor whiteColor];
    cityState.font = [UIFont boldSystemFontOfSize:12];
    [cell.contentView addSubview:cityState];
    
    NSLog(@"posts:%@",self.postArray);
    
    return cell;
}

-(void) downloadPostforPage: (NSInteger) pageNumber andPageSize: (NSInteger)pageSize
{
    
    //Get the post for launch screen
    NSString *currentCategory = [TiesUser getInstance].postCategory;

    AFHTTPClient *client = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:@"http://198.100.174.21/"]];
    NSString *getPath = [NSString stringWithFormat:@"post/%@?pageNumber=%lu&pageSize=%lu",currentCategory,(unsigned long)pageNumber,(unsigned long)pageSize];
    
    [client getPath:getPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseOject) {
        
        NSError *e = nil;
        NSDictionary *json = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:responseOject options:NSJSONReadingMutableContainers error:&e];
         
        self.postArray = [[NSArray alloc]init];
        
        self.postArray = [json objectForKey:@"list"];
        if (self.postArray.count) {
        [self.postTableV reloadData];
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        
    }];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 320.0f;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
