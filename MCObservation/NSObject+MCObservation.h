//
//  NSObject+MCObservation.h
//  MCObservation
//
//  Created by Matthew Cheok on 31/5/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MCValueObserver.h"
#import "MCNotificationObserver.h"

@interface NSObject (MCObservation)

- (void)mc_observeKeyPath:(NSString *)keyPath withBlock:(MCObservationBlock)block;
- (void)mc_stopObservingKeyPath:(NSString *)keyPath;

- (void)mc_observeObject:(id)object forKeyPath:(NSString *)keyPath withBlock:(MCObservationBlock)block;
- (void)mc_stopObservingObject:(id)object forKeyPath:(NSString *)keyPath;

- (void)mc_observeNotificatonWithName:(NSString *)name withBlock:(MCNotificationBlock)block;
- (void)mc_stopObservingNotificatonWithName:(NSString *)name;

@end
