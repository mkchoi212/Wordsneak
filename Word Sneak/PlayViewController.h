//
//  ViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 12/12/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PlayViewController : UIViewController{
    NSTimer *countdownTimer;
    int secondCount;
    NSMutableArray *word_list;
    NSMutableArray *naughty_list;
    NSMutableArray *da_list;
    int playerScores[4];
}

- (IBAction)tap_start:(id)sender;
- (IBAction)correctButton:(id)sender;
- (IBAction)wrongButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *intro1;
@property (weak, nonatomic) IBOutlet UILabel *intro2;
@property (weak, nonatomic) IBOutlet UILabel *player_name;
@property (weak, nonatomic) IBOutlet UILabel *timer_label;
@property (weak, nonatomic) IBOutlet UILabel *da_word;
@property (weak, nonatomic) IBOutlet UIButton *da_button;
@property (weak, nonatomic) IBOutlet UIButton *fail_button;
@property (weak, nonatomic) IBOutlet UIButton *quitButton;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *intro_tap;
@property (nonatomic, assign) NSInteger category;
- (IBAction)quit:(id)sender;

@property (nonatomic, assign) NSInteger playerNumber;

@end


