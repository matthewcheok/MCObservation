//
//  MCNotificationObserver.m
//  MCObservationDemo
//
//  Created by Matthew Cheok on 2/6/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotificationObserver.h"

@implementation MCNotificationObserver

- (instancetype)initWithNotificationName:(NSString *)name notificationBlock:(MCNotificationBlock)notificationBlock {
	self = [super init];
	if (self) {
		NSParameterAssert(name.length > 0);
		NSParameterAssert(notificationBlock != nil);

		_notificationName = name;
		_notificationBlock = [notificationBlock copy];

		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mc_handleNotification:) name:name object:nil];
	}
	return self;
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:_notificationName object:nil];
}

#pragma mark - Methods

- (void)mc_handleNotification:(NSNotification *)notification {
	if (self.notificationBlock) {
		self.notificationBlock(notification);
	}
}

@end
