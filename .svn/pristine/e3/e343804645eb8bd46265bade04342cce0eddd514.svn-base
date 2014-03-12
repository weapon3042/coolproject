//
//  TiesNewPostViewController.m
//  Ties
//
//  Created by Kelvin Lam on 2/22/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesNewPostViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TiesTransitions.h"
#import "TiesLoginViewController.h"
#import "TiesHeaderViewController.h"
@interface TiesNewPostViewController ()
@property (strong,nonatomic) id<ECSlidingViewControllerDelegate> transition;

@end

@implementation TiesNewPostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureMenu];
    [self drawGlobalHeader];

}

-(void) drawGlobalHeader {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TiesHeaderViewController *headerViewC = [storyBoard instantiateViewControllerWithIdentifier:@"tiesHeader"];
    headerViewC.view.frame = CGRectMake(0, 0, 320, 44);
    UIImageView *iV = [[UIImageView alloc]initWithFrame:CGRectMake(135, 22, 51, 22)];
    iV.image = [UIImage imageNamed:@"post_title.png"];
    [headerViewC.view addSubview:iV];
    [self.view addSubview:headerViewC.view];
    
    
    UIButton *navBtn = [[UIButton alloc]initWithFrame:CGRectMake(22, 22, 22, 22)];
    [navBtn setImage:[UIImage imageNamed:@"hotkey.png"] forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(showLeftNav) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBtn];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configureMenu{
    
    self.slidingViewController.delegate = self.transition;
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.slidingViewController.customAnchoredGestures = @[];
    [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
}

-(void)showLeftNav {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}
@end
