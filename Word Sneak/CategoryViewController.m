//
//  CategoryViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/14/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "CategoryViewController.h"
#import "PlayViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pg13:(id)sender {
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PlayViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"play"];
    detail.category = 0;
    [self.navigationController pushViewController:detail animated:YES];

}

- (IBAction)rrated:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PlayViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"play"];
    detail.category = 1;
    [self.navigationController pushViewController:detail animated:YES];
}


@end
