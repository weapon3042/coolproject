//
//  TiesUser.m
//  Ties
//
//  Created by wan, peng on 3/8/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesUser.h"

@implementation TiesUser

+ (TiesUser *)getInstance {
    static TiesUser *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TiesUser alloc] init];
    });
    
    return _sharedInstance;
}

@end
