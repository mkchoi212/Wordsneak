//
//  TutorialViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRDynamicSlideShow.h"

@interface TutorialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *thumbs;
@property (weak, nonatomic) IBOutlet DRDynamicSlideShow *slideShow;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)gucci:(id)sender;
@end
