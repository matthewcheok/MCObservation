//
//  MCValueObserver.m
//  MCObservationDemo
//
//  Created by Matthew Cheok on 2/6/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCValueObserver.h"

@interface MCValueObserver ()
@end

@implementation MCValueObserver

- (instancetype)initWithObject:(id)object keyPath:(NSString *)keyPath observationBlock:(MCObservationBlock)observationBlock {
    self = [super init];
    if (self) {
        NSParameterAssert(keyPath.length > 0);
        NSParameterAssert(observationBlock != nil);
        NSParameterAssert(object != nil);

        _object = object;
        _keyPath = keyPath;
        _observationBlock = [observationBlock copy];
        
        [_object addObserver:self forKeyPath:_keyPath options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void *)(self)];
    }
    return self;
}

- (void)dealloc {
    [_object removeObserver:self forKeyPath:_keyPath context:(__bridge void *)(self)];
}

#pragma mark - Methods

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == (__bridge void *)(self) &&
        object == self.object &&
        [keyPath isEqualToString:self.keyPath]) {
        
        if (self.observationBlock) {
            self.observationBlock(keyPath, change);
        }
    }
}


@end
