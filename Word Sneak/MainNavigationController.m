//
//  MainNavigationController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "MainNavigationController.h"
#import "LaunchViewController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}


@end
