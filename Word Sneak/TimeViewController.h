//
//  TimeViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 1/3/15.
//  Copyright (c) 2015 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKPickerView.h"

@interface TimeViewController : UIViewController
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButt;

@end
