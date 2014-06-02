//
//  MCNotificationObserver.h
//  MCObservationDemo
//
//  Created by Matthew Cheok on 2/6/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MCNotificationBlock)(NSNotification *notification);

@interface MCNotificationObserver : NSObject

@property (nonatomic, copy, readonly) NSString *notificationName;
@property (nonatomic, copy, readonly) MCNotificationBlock notificationBlock;

- (instancetype)initWithNotificationName:(NSString *)keyPath notificationBlock:(MCNotificationBlock)notificationBlock;

@end
