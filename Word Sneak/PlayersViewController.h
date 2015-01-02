//
//  PlayersViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 12/29/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKPickerView.h"
#import "PlayViewController.h"
@interface PlayersViewController : UIViewController
@property (nonatomic, strong) PlayViewController *playScreen;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (nonatomic) NSInteger number;
- (IBAction)goPlaya:(id)sender;

@end
