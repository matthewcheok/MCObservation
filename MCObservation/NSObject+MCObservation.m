//
//  NSObject+MCObservation.m
//  MCObservation
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "NSObject+MCObservation.h"

#import <objc/runtime.h>

@implementation NSObject (MCObservation)

#pragma mark - Properties

- (NSMutableArray *)mc_observers {
	NSMutableArray *array = objc_getAssociatedObject(self, @selector(mc_observers));
	if (!array) {
		array = [NSMutableArray array];
		objc_setAssociatedObject(self, @selector(mc_observers), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return array;
}

#pragma mark - Convenience

- (void)mc_observeKeyPath:(NSString *)keyPath withBlock:(MCObservationBlock)block {
    [self mc_observeObject:self forKeyPath:keyPath withBlock:block];
}

- (void)mc_stopObservingKeyPath:(NSString *)keyPath {
    [self mc_stopObservingObject:self forKeyPath:keyPath];
}

- (void)mc_observeObject:(id)object forKeyPath:(NSString *)keyPath withBlock:(MCObservationBlock)block {
    MCValueObserver *observer = [[MCValueObserver alloc] initWithObject:object keyPath:keyPath observationBlock:block];
	NSMutableArray *array = [self mc_observers];
    [array addObject:observer];
}

- (void)mc_stopObservingObject:(id)object forKeyPath:(NSString *)keyPath {
	NSMutableArray *array = [self mc_observers];
    NSMutableArray *itemsToRemove = [NSMutableArray array];
    
    for (id item in array) {
        if ([item isKindOfClass:[MCValueObserver class]]) {
            MCValueObserver *observer = item;
            if (observer.object == object &&
                [observer.keyPath isEqualToString:keyPath]) {
                [itemsToRemove addObject:observer];
            }
        }
    }
    [array removeObjectsInArray:itemsToRemove];
}

- (void)mc_observeNotificatonWithName:(NSString *)name withBlock:(MCNotificationBlock)block {
    MCNotificationObserver *observer = [[MCNotificationObserver alloc] initWithNotificationName:name notificationBlock:block];
    NSMutableArray *array = [self mc_observers];
    [array addObject:observer];
}

- (void)mc_stopObservingNotificatonWithName:(NSString *)name {
    NSMutableArray *array = [self mc_observers];
    NSMutableArray *itemsToRemove = [NSMutableArray array];
    
    for (id item in array) {
        if ([item isKindOfClass:[MCNotificationObserver class]]) {
            MCNotificationObserver *observer = item;
            if ([observer.notificationName isEqualToString:name]) {
                [itemsToRemove addObject:observer];
            }
        }
    }
    [array removeObjectsInArray:itemsToRemove];
}

@end
