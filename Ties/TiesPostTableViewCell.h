//
//  TiesPostTableViewCell.h
//  Ties
//
//  Created by peng wan on 3/9/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiesPostTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel* subtitle;
@property (strong, nonatomic) UILabel* cityState;
@property (strong, nonatomic) UILabel* label;
@property (strong, nonatomic) NSString* imageURL;
@property (strong, nonatomic) UIView* subtitleV;
@property (strong, nonatomic) UIImageView* postImg;

-(void)setupCell;
//- (id)initWithtitle:(NSString *)title cityState:(NSString *)cityState URL:(NSString *)url;

@end
