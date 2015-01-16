//
//  LaunchViewController.m
//  DRDynamicSlideShow
//
//  Created by David Román Aguirre on 17/09/13.
//  Copyright (c) 2013 David Román Aguirre. All rights reserved.
//

#import "LaunchViewController.h"
#import "MenuViewController.h"

@implementation LaunchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
        // Set the slide show view's alpha so that we can fade it in later
        [self.slideShow setAlpha:0];
        
        // Set the content size
        [self.slideShow setContentSize:CGSizeMake(1930, self.slideShow.frame.size.height)];
        
        // Set the "did reach page block"
        [self.slideShow setDidReachPageBlock:^(NSInteger reachedPage) {
        self.pageControl.currentPage = reachedPage;
        }];
        // Add the animations
       [self setupSlideShowSubviewsAndAnimations];

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.slideShow setAlpha:1];
    } completion:nil];
}

- (void)setupSlideShowSubviewsAndAnimations {
    #pragma mark Page 0
     
     // RISING TO TOP ANIMATION
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.title_1 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.title_1.center.x+self.slideShow.frame.size.width, self.title_1.center.y-self.slideShow.frame.size.height)] delay:0]];
     
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.title_11 page:0 keyPath:@"alpha" toValue:@0 delay:0.5]];
     
     // DROPPING BELLOW ANIMATION
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.title_11 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.title_11.center.x+self.slideShow.frame.size.width, self.title_11.center.y+self.slideShow.frame.size.height*2)] delay:0]];
    
     #pragma mark Page 1

    [self.pic_2 setCenter:CGPointMake(self.pic_2.center.x-self.slideShow.frame.size.width, self.pic_2.center.y-self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.pic_2 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.pic_2.center.x+self.slideShow.frame.size.width, self.pic_2.center.y+self.slideShow.frame.size.height)] delay:0]];

   
    
    // DROPPING FROM BOTTOM
    
    [self.a1 setCenter:CGPointMake(self.a1.center.x-self.slideShow.frame.size.width, self.a1.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.a1 page:1 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.a1.center.x+self.slideShow.frame.size.width, self.a1.center.y-self.slideShow.frame.size.height)] delay:0]];
    
    [self.a2 setCenter:CGPointMake(self.a2.center.x-self.slideShow.frame.size.width, self.a2.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.a2 page:1 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.a2.center.x+self.slideShow.frame.size.width, self.a2.center.y-self.slideShow.frame.size.height)] delay:0]];

    
    [self.arrow1 setCenter:CGPointMake(self.arrow1.center.x-self.slideShow.frame.size.width, self.arrow1.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.arrow1 page:1 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.arrow1.center.x+self.slideShow.frame.size.width, self.arrow1.center.y-self.slideShow.frame.size.height)] delay:0]];
    
    [self.arrow2 setCenter:CGPointMake(self.arrow2.center.x-self.slideShow.frame.size.width, self.arrow2.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.arrow2 page:1 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.arrow2.center.x+self.slideShow.frame.size.width, self.arrow2.center.y-self.slideShow.frame.size.height)] delay:0]];
    
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.d1 page:3 keyPath:@"alpha" toValue:@0 delay:0.5]];

    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.d1 page:3 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.d1.center.x+self.slideShow.frame.size.width, self.d1.center.y+self.slideShow.frame.size.height*2)] delay:0]];

    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.d2 page:3 keyPath:@"alpha" toValue:@0 delay:0.5]];
    
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.d2 page:3 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.d2.center.x+self.slideShow.frame.size.width, self.d2.center.y+self.slideShow.frame.size.height*2)] delay:0]];

     
      [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.thumbs page:4 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];
   

}


- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait + UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end