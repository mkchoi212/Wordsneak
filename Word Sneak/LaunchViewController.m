//
//  LaunchViewController.m
//  DRDynamicSlideShow
//
//  Created by David Román Aguirre on 17/09/13.
//  Copyright (c) 2013 David Román Aguirre. All rights reserved.
//

#import "LaunchViewController.h"

@implementation LaunchViewController

/*- (IBAction)into_main_button {
    MainViewController *main = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:main animated:YES completion:NULL];
}*/

- (void)viewDidLoad {
    [super viewDidLoad];

    // Set the slide show view's alpha so that we can fade it in later
        [self.slideShow setAlpha:0];
        
        // Set the content size
        [self.slideShow setContentSize:CGSizeMake(1600, self.slideShow.frame.size.height)];
        
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
    
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.slideShow setAlpha:1];
    } completion:nil];
}

- (void)setupSlideShowSubviewsAndAnimations {
    #pragma mark Page 0
     
     // RISING TO TOP ANIMATION
    /* [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.intitle_0 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.intitle_0.center.x+self.slideShow.frame.size.width, self.intitle_0.center.y-self.slideShow.frame.size.height)] delay:0]];
     
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.indes_0 page:0 keyPath:@"alpha" toValue:@0 delay:0.5]];
     
     // DROPPING BELLOW ANIMATION
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.indes_0 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.indes_0.center.x+self.slideShow.frame.size.width, self.indes_0.center.y+self.slideShow.frame.size.height*2)] delay:0]];
     
     #pragma mark Page 1
    
    // DROPPING FROM TOP

    [self.inpic_1 setCenter:CGPointMake(self.inpic_1.center.x-self.slideShow.frame.size.width, self.inpic_1.center.y-self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_1 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.inpic_1.center.x+self.slideShow.frame.size.width, self.inpic_1.center.y+self.slideShow.frame.size.height)] delay:0]];
    
    [self.inpic_11 setCenter:CGPointMake(self.inpic_11.center.x-self.slideShow.frame.size.width, self.inpic_11.center.y-self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_11 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.inpic_11.center.x+self.slideShow.frame.size.width, self.inpic_11.center.y+self.slideShow.frame.size.height)] delay:0]];
    
    
    // DROPPING FROM BOTTOM
    
    [self.inpic_111 setCenter:CGPointMake(self.inpic_111.center.x-self.slideShow.frame.size.width, self.inpic_111.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_111 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.inpic_111.center.x+self.slideShow.frame.size.width, self.inpic_111.center.y-self.slideShow.frame.size.height)] delay:0]];
    
    [self.inpic_1111 setCenter:CGPointMake(self.inpic_1111.center.x-self.slideShow.frame.size.width, self.inpic_1111.center.y+self.slideShow.frame.size.height)];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_1111 page:0 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.inpic_1111.center.x+self.slideShow.frame.size.width, self.inpic_1111.center.y-self.slideShow.frame.size.height)] delay:0]];
    
     
     #pragma mark Page 2
     
     // ROLLING IN ANIMATION
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_2 page:1 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_22 page:1 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];
     
     [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_222 page:1 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];
     
     #pragma mark Page 3
    
    [self.inpic_3 setCenter:CGPointMake(self.inpic_3.center.x-self.slideShow.frame.size.width, self.inpic_3.center.y+self.slideShow.frame.size.height)];
    
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_3 page:2 keyPath:@"center" toValue:[NSValue valueWithCGPoint:CGPointMake(self.inpic_3.center.x+self.slideShow.frame.size.width, self.inpic_3.center.y-self.slideShow.frame.size.height)] delay:0]];

     
    # pragma mark Page 4
    
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inname_4 page:3 keyPath:@"alpha" fromValue:@0 toValue:@1 delay:0.75]];
    
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_4 page:3 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];
    [self.slideShow addAnimation:[DRDynamicSlideShowAnimation animationForSubview:self.inpic_44 page:3 keyPath:@"transform" fromValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(-1.9)] toValue:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(0)] delay:0.1]];*/

}


- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait + UIInterfaceOrientationMaskPortraitUpsideDown;
}


@end