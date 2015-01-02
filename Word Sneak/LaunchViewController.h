//
//  LaunchViewController.h
//  DRDynamicSlideShow
//
//  Created by David Román Aguirre on 17/09/13.
//  Copyright (c) 2013 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRDynamicSlideShow.h"

@interface LaunchViewController : UIViewController <UIBarPositioningDelegate>

// Slide Show
@property (weak, nonatomic) IBOutlet DRDynamicSlideShow *slideShow;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;



@end