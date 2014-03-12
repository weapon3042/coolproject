//
//  TiesAbstractViewController.m
//  Ties
//
//  Created by peng wan on 3/5/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.

#import "TiesAbstractViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TiesHeaderViewController.h"

@interface TiesAbstractViewController ()
@property (strong,nonatomic) id<ECSlidingViewControllerDelegate> transition;
@property UINavigationController *nav;
@end

@implementation TiesAbstractViewController

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

-(void) setTitleImageWithName: (NSString *)imageName atX: (float)x Y:(float)y width: (float)width andHeight: (float)height
{
    UIImageView *iV = [[UIImageView alloc]initWithFrame:CGRectMake(x,y,width,height)];
    iV.image = [UIImage imageNamed:imageName];
    [self.view addSubview:iV];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) drawGlobalHeader {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TiesHeaderViewController *headerViewC = [storyBoard instantiateViewControllerWithIdentifier:@"tiesHeader"];
    headerViewC.view.frame = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:headerViewC.view];
    
    
    UIButton *navBtn = [[UIButton alloc]initWithFrame:CGRectMake(6, 18, 22, 22)];
    [navBtn setImage:[UIImage imageNamed:@"hotkey.png"] forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(showLeftNav) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBtn];
    
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
