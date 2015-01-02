//
//  PlayersViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/29/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "PlayersViewController.h"

@interface PlayersViewController () <AKPickerViewDelegate, AKPickerViewDataSource>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) AKPickerView *pickerView;
@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.pickerView = [[AKPickerView alloc] initWithFrame:self.view.bounds];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = false;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"AvenirNext-Regular" size:40];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"AvenirNext-Medium" size:40];
    self.pickerView.interitemSpacing = 20.0;
    self.pickerView.fisheyeFactor = 0.002;
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
    
    self.titles = @[@"1 PLAYA", @"2 PLAYERS", @"3 PLAYERS", @"4 PLAYERS"];
    [self.view bringSubviewToFront:self.goButton];
    [self.pickerView reloadData];

}

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return [self.titles count];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.titles[item];
}

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    if (nil == self.playScreen)
    {
        self.playScreen = [[PlayViewController alloc] init];
    }

    self.playScreen.playerNumber = item;
    NSLog(@"%ld", (long)self.playScreen.playerNumber);
}
- (IBAction)goPlaya:(id)sender {
}
@end
