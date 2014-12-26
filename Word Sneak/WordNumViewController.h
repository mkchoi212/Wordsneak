//
//  WordNumViewController.h
//  Word Sneak
//
//  Created by Mike Choi on 12/18/14.
//  Copyright (c) 2014 Life+ Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKPickerView.h"

@interface WordNumViewController : UIViewController
@property (nonatomic, assign) NSInteger *itemNum;
@property (strong, nonatomic) IBOutlet AKPickerView *pickerView;
@end
