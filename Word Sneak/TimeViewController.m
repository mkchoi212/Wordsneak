//
//  TimeViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 1/3/15.
//  Copyright (c) 2015 Life+ Dev. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController () <AKPickerViewDataSource, AKPickerViewDelegate>
@property (nonatomic, strong) AKPickerView *pickerView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic) NSInteger timeChosen;
@end

@implementation TimeViewController

- (void)viewDidLoad {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedTime = [defaults integerForKey:@"time"];
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
    
    self.titles = @[@"1 Minute", @"2 Minutes", @"3 Minutes", @"4 Minutes", @"5 Minutes", @"6 Minutes"];

    [self.pickerView reloadData];
    [self.view bringSubviewToFront:self.saveButt];
       [self.pickerView selectItem:savedTime animated:YES];
    
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
    self.timeChosen = item;
}

- (IBAction)save:(id)sender {
    // Create strings and integer to store the text info
    NSInteger time = self.timeChosen;
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:time forKey:@"time"];
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
