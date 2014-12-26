//
//  MenuViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "MenuViewController.h"
#import "CBZSplashView.h"

@interface MenuViewController ()
@property (nonatomic, strong) CBZSplashView *splashView;
@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __unused UIImage *icon = [UIImage imageNamed:@"splash"];

    UIColor *color = [UIColor colorWithRed:27.0/255.0 green:125.0/255.0 blue:191.0/255.0 alpha:1];
    
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:icon backgroundColor:color];
    splashView.animationDuration = 1.4;
    [self.view addSubview:splashView];
    self.splashView = splashView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /* wait a beat before animating in */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.splashView startAnimation];
    });
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
