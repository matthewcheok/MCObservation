//
//  MCDemoViewCell.m
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCDemoViewCell.h"
#import <NSObject+MCObservation.h>

@implementation MCDemoViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setup];
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];

	[self setup];
}

- (void)setup {
	[self mc_observeKeyPath:@"object.title" withBlock: ^(NSString *keyPath, NSDictionary *change) {
	    self.textLabel.text = self.object.title;
	}];
}

@end
