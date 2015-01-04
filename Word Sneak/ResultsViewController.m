//
//  ResultsTableViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/27/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "ResultsViewController.h"
#import "MenuViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    playa = [[NSMutableArray alloc] init];
    player_scores = [[NSMutableArray alloc] init];
    
    [player_scores addObject:[NSNumber numberWithInteger:self.p1_score]];
    [player_scores addObject:[NSNumber numberWithInteger:self.p2_score]];
    [player_scores addObject:[NSNumber numberWithInteger:self.p3_score]];
    [player_scores addObject:[NSNumber numberWithInteger:self.p4_score]];
    
    [playa addObject:@"PLAYER I"];
    [playa addObject:@"PLAYER II"];
    [playa addObject:@"PLAYER III"];
    [playa addObject:@"PLAYER IV"];




}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"hello";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor clearColor];

    UILabel *playaName = [[UILabel alloc]initWithFrame:CGRectMake(35, 7, 135, 29)];
    playaName.font = [UIFont fontWithName:@"AppleColorEmoji" size:20];
    playaName.textColor = [UIColor colorWithRed:255.0/255.0 green:163.0/255.0 blue:55.0/255.0 alpha:1];
    playaName.text = [playa objectAtIndex:indexPath.row];
    [cell.contentView addSubview:playaName];
    
    
    UILabel *playScore = [[UILabel alloc]initWithFrame:CGRectMake(207, 7, 75, 29)];
    playScore.font = [UIFont fontWithName:@"AppleColorEmoji" size:20];
    playScore.textColor = [UIColor colorWithRed:34.0/255.0 green:251.0/255.0 blue:1 alpha:1];
    NSArray * scores = [player_scores valueForKey:@"stringValue"];
    playScore.text = [scores objectAtIndex:indexPath.row];
    [cell.contentView addSubview:playScore];
    return cell;
    
}



- (IBAction)homeButton:(id)sender {

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MenuViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController presentViewController:home animated:YES completion:nil];
}

- (IBAction)shareButton:(id)sender {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *textToShare = @"I got the high score on this awesome game called Word Sneak, available now on the Apple App Store!";
      NSArray *itemsToShare = @[textToShare, screenshot];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeAssignToContact];
    [self presentViewController:activityVC animated:YES completion:nil];
}

#pragma mark Rotation lock
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

@end
