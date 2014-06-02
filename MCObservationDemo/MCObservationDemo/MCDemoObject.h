//
//  MCDemoObject.h
//  MCViewDemo
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCDemoObject : NSObject

@property (nonatomic, copy) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end
