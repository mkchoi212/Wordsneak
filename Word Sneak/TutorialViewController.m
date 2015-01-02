//
//  TutorialViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the slide show view's alpha so that we can fade it in later
    [self.slideShow setAlpha:0];
    
    // Set the content size
    [self.slideShow setContentSize:CGSizeMake(1800, self.slideShow.frame.size.height)];
    
    // Set the "did reach page block"
    [self.slideShow setDidReachPageBlock:^(NSInteger reachedPage) {
        NSLog(@"Current Page: %li", (long)reachedPage);
        self.pageControl.currentPage = reachedPage;
    }];
    // Add the animations
    [self setupSlideShowSubviewsAndAnimations];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:1.0 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.slideShow setAlpha:1];
    } completion:nil];
}

- (void)setupSlideShowSubviewsAndAnimations {
    [self.thumbs setCenter:CGPointMake(self.thumbs.center.x-self.slideShow.frame.size.width, self.thumbs.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.thumbs page:1 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.thumbs.center.x+self.slideShow.frame.size.width, self.thumbs.center.y-self.slideShow.frame.size.height)] delay:0]];
}


- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}



- (IBAction)gucci:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}
@end
