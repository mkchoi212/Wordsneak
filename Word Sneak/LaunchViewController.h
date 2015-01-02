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
@property (weak, nonatomic) IBOutlet UILabel *title_1;
@property (weak, nonatomic) IBOutlet UILabel *title_11;

@property (weak, nonatomic) IBOutlet UIImageView *pic_2;

@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UILabel *a1;
@property (weak, nonatomic) IBOutlet UILabel *a2;
@property (weak, nonatomic) IBOutlet UIImageView *d1;
@property (weak, nonatomic) IBOutlet UIImageView *d2;
@property (weak, nonatomic) IBOutlet UIImageView *thumbs;

@end