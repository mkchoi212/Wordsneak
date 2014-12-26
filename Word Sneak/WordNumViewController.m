//
//  WordNumViewController.m
//  Word Sneak
//
//  Created by Mike Choi on 12/18/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import "WordNumViewController.h"
#import "AKPickerView.h"
#import "PlayViewController.h"

@interface WordNumViewController () <AKPickerViewDataSource, AKPickerViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@end

@implementation WordNumViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    self.pickerView = [[AKPickerView alloc] initWithFrame:self.view.bounds];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.pickerView.textColor = [UIColor whiteColor];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.pickerView.interitemSpacing = 15.0;
    self.pickerView.fisheyeFactor = 0.009;
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
    
    
    self.titles = @[@"Full",
                        @"Half",
                        @"Quarter",
                        @"Just trying out!"];

    [self.pickerView reloadData];
}

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return 4;
}



- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.titles[item];
}





@end
