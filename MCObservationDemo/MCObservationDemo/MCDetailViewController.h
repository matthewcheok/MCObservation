//
//  MCDetailViewController.h
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCDemoObject.h"

@interface MCDetailViewController : UIViewController

@property (strong, nonatomic) MCDemoObject *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
