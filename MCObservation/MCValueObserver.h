//
//  MCValueObserver.h
//  MCObservationDemo
//
//  Created by Matthew Cheok on 2/6/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MCObservationBlock)(NSString *keyPath, NSDictionary *change);

@interface MCValueObserver : NSObject

@property (nonatomic, weak, readonly) id object;
@property (nonatomic, copy, readonly) NSString *keyPath;
@property (nonatomic, copy, readonly) MCObservationBlock observationBlock;

- (instancetype)initWithObject:(id)object keyPath:(NSString *)keyPath observationBlock:(MCObservationBlock)observationBlock;

@end
