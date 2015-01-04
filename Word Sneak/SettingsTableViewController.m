//
//  SettingsTableViewController.m
//  
//
//  Created by Mike Choi on 1/2/15.
//
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
       BOOL isSound= [[NSUserDefaults standardUserDefaults] objectForKey:@"Sound"];
    if (isSound){
            self.soundSwitch.on=TRUE;
        }
        else{
            self.soundSwitch.on=FALSE;
        }
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    if (self.soundSwitch.on)
    {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[NSNumber numberWithBool:1] forKey:@"Sound"];
        [defaults synchronize];
        
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[NSNumber numberWithBool:0] forKey:@"Sound"];
        [defaults synchronize];
        
        
    }
}
@end
