//
//  ResultsTableViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 12/27/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{

    NSMutableArray *player_scores;
    NSMutableArray *playa;

}
@property (nonatomic) NSInteger p1_score;
@property (nonatomic) NSInteger p2_score;
@property (nonatomic) NSInteger p3_score;
@property (nonatomic) NSInteger p4_score;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *home;
- (IBAction)homeButton:(id)sender;
- (IBAction)shareButton:(id)sender;

@end
