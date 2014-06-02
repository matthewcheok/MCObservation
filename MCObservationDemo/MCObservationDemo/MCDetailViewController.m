//
//  MCDetailViewController.m
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCDetailViewController.h"

#import <NSObject+MCObservation.h>
#import <UIViewController+MCObservation.h>

@interface MCDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (void)configureView;

@end

@implementation MCDetailViewController

- (IBAction)textValueChanged:(UITextField *)textField {
	self.detailItem.title = textField.text;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
		_detailItem = newDetailItem;

		// Update the view.
		[self configureView];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.

	if (self.detailItem) {
		self.textField.text = self.detailItem.title;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	[self configureView];
	[self mc_animateAlongsideKeyboardWithShowAnimations: ^(CGRect keyboardFrame) {
	    self.textField.backgroundColor = [UIColor colorWithRed:1.000 green:0.231 blue:0.188 alpha:0.5];
	} andHideAnimations: ^(CGRect keyboardFrame) {
	    self.textField.backgroundColor = nil;
	}];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
