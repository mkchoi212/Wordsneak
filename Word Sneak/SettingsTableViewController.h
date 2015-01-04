//
//  SettingsTableViewController.h
//  
//
//  Created by Mike Choi on 1/2/15.
//
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *soundSwitch;
- (IBAction)buttonClicked:(id)sender;

@end
