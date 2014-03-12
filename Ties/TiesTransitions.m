//
//  TiesTransitions.m
//  Ties
//
//  Created by peng wan on 2/11/14.
//  Copyright (c) 2014 IDesign Network Inc. All rights reserved.
//

#import "TiesTransitions.h"

@implementation TiesTransitions

- (TiesZoomAnimationControllerViewController *)zoomAnimationController
{
    if (!_zoomAnimationController) {
        self.zoomAnimationController = [[TiesZoomAnimationControllerViewController alloc] init];
    }
    return _zoomAnimationController;
}


@end
