//
//  TiesMenuViewController.m
//  Ties
//
//  Created by peng wan on 2/17/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesMenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TiesUser.h"

@interface TiesMenuViewController ()
@property (nonatomic, strong) UINavigationController *transitionNavigationController;

@end

@implementation TiesMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
//-(void)viewWillLayoutSubviews
//{
//    self.tableView.separatorColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor colorWithRed:43/255 green:43/255 blue:43/255 alpha:1.0];
//
//}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.transitionNavigationController = (UINavigationController *)self.slidingViewController.topViewController;
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
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TiesMenuItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Post";
//            [[TiesUser getInstance] setPostCategory:@"Coffee"];
            break;

        case 1:
            cell.textLabel.text = @"Do Coffee";
            [[TiesUser getInstance] setPostCategory:@"Breakfast"];

            break;
        case 2:
            cell.textLabel.text = @"Do Breakfast";
            [[TiesUser getInstance] setPostCategory:@"Lunch"];

            break;
        case 3:
            cell.textLabel.text = @"Do Lunch";
            [[TiesUser getInstance] setPostCategory:@"Dinner"];
            break;
        case 4:
            cell.textLabel.text = @"Do Dinner";

            break;
        case 5:
            cell.textLabel.text = @"My Posts";
            
            break;

        case 6:
            cell.textLabel.text = @"+New Post";
            
            break;

        case 7:
            cell.textLabel.text = @"Bids";
            
            break;
        
        case 8:
            cell.textLabel.text = @"Incoming Bids";
            
            break;

        case 9:
            cell.textLabel.text = @"Outgoing Bids";
            
            break;

        case 10:
            cell.textLabel.text = @"Meetups";
            
            break;

        case 11:
            cell.textLabel.text = @"Messages";
            
            break;
        case 12:
            cell.textLabel.text = @"Profile";
            
            break;
        case 13:
            cell.textLabel.text = @"My Points";
            
            break;
        case 14:
            cell.textLabel.text = @"Collection";
            
            break;

        case 15:
            cell.textLabel.text = @"About";
            
            break;



        default:
            break;
    }
    cell.textColor = [UIColor whiteColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.slidingViewController resetTopViewAnimated:YES];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

    switch (indexPath.row) {
       
        case 0:
            self.slidingViewController.topViewController = [storyBoard instantiateViewControllerWithIdentifier:@"TiesMainViewController"];
            [self.slidingViewController resetTopViewAnimated:YES];
            break;
        case 1:
            self.slidingViewController.topViewController = [storyBoard instantiateViewControllerWithIdentifier:@"postView"];
            [self.slidingViewController resetTopViewAnimated:YES];
            break;
        case 2:
            self.slidingViewController.topViewController = [storyBoard instantiateViewControllerWithIdentifier:@"postView"];
            [self.slidingViewController resetTopViewAnimated:YES];
            
            break;
        case 3:
            self.slidingViewController.topViewController = [storyBoard instantiateViewControllerWithIdentifier:@"postView"];
            [self.slidingViewController resetTopViewAnimated:YES];
            
            break;
        case 4:
            self.slidingViewController.topViewController = [storyBoard instantiateViewControllerWithIdentifier:@"postDetail"];
            [self.slidingViewController resetTopViewAnimated:YES];
            
            break;
            
        default:
            break;
    }

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor colorWithRed:43/255.0 green:43/255.0 blue:43/255.0 alpha:1.0]];
    
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
