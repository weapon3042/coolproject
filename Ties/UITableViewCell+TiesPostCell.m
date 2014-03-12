//
//  UITableViewCell+TiesPostCell.m
//  Ties
//
//  Created by peng wan on 3/9/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "UITableViewCell+TiesPostCell.h"

@implementation UITableViewCell (TiesPostCell)

-(void)viewDidLoad
{
    //    self.contentView.layer.borderWidth = 0.5f;
    //    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backgroundColor = [UIColor whiteColor];
    
    self.postImg = [[UIImageView alloc]init];
    self.postImg.frame = CGRectMake(0, 0, 320, 320);
    [self.contentView addSubview:self.postImg];
    
    self.subtitleV = [[UIView alloc]initWithFrame:CGRectMake(0, 280, 320, 40)];
    self.subtitleV.backgroundColor = [UIColor colorWithRed:49/255 green:51/255 blue:55/255 alpha:0.4];
    [self.contentView addSubview:self.subtitleV];
    
    self.subtitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 320, 20)];
    self.subtitle.textColor = [UIColor whiteColor];
    self.subtitle.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:self.subtitle];
    
    self.cityState = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 320, 20)];
    self.cityState.textColor = [UIColor whiteColor];
    self.cityState.font = [UIFont boldSystemFontOfSize:12];
    [self.contentView addSubview:self.cityState];
    
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, 320, 60)];
    self.label.textAlignment = UITextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:24];
    [self.contentView addSubview:self.label];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, 320)];
    self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont boldSystemFontOfSize:30.0];
    self.label.backgroundColor = [UIColor underPageBackgroundColor];
    self.label.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.label];;
    self.contentView.layer.borderWidth = 0.5f;
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

@end
