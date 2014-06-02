//
//  MCDemoObject.m
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCDemoObject.h"

@implementation MCDemoObject

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}

@end
