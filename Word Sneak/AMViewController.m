//
//  AMViewController.m
//  TagListViewDemo
//
//  Created by Andrea Mazzini on 20/01/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "AMViewController.h"
#import "AMTagListView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface AMViewController () <UITextFieldDelegate, UIAlertViewDelegate, AMTagListDelegate>

@property (weak, nonatomic) IBOutlet UITextField    *textField;
@property (weak, nonatomic) IBOutlet AMTagListView	*tagListView;
@property (nonatomic, strong) AMTagView             *selection;

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Custom Word List";
	[self.textField.layer setBorderColor:UIColorFromRGB(0xFFFFFF).CGColor];
	[self.textField.layer setBorderWidth:2];
	[self.textField setDelegate:self];
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"add word" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
    self.textField.attributedPlaceholder = str;
    
	[[AMTagView appearance] setTagLength:10];
	[[AMTagView appearance] setTextPadding:14];
	[[AMTagView appearance] setTextFont:[UIFont fontWithName:@"Baskerville" size:26]];
	[[AMTagView appearance] setTagColor:UIColorFromRGB(0x848484)];
	
    
    self.tagListView.tagListDelegate = self;
	
	__weak AMViewController* weakSelf = self;
	[self.tagListView setTapHandler:^(AMTagView *view) {
		weakSelf.selection = view;
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete"
														message:[NSString stringWithFormat:@"Delete %@?", [view tagText]]
													   delegate:weakSelf
											  cancelButtonTitle:@"No"
											  otherButtonTitles:@"Yes", nil];
		[alert show];
	}];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex > 0) {
		[self.tagListView removeTag:self.selection];
	}
}

- (BOOL)tagList:(AMTagListView *)tagListView shouldAddTagWithText:(NSString *)text resultingContentSize:(CGSize)size
{
   return 1;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self.tagListView addTag:textField.text];
	[self.textField setText:@" "];
    [self.customList addObject:textField.text];
	return YES;
}

// Close the keyboard when the user taps away froma  textfield
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
    }
}

@end
