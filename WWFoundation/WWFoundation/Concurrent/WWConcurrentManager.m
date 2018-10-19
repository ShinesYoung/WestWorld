//
//  WWConcurrentManager.m
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWConcurrentManager.h"

#import "WWSemaphoreQueue.h"

@interface WWConcurrentManager ()

@end


@implementation WWConcurrentManager

/******************************************************************************/
/**** System - Lifecycle & Constructor                                     ****/
/******************************************************************************/
#pragma mark - System - Lifecycle & Constructor

+ (id<WWDispatchQueue>)mainThreadQueue
{
    static id<WWDispatchQueue> instanceOfMainThreadQueue = nil;
    static dispatch_once_t mainThreadOnceToken;
    dispatch_once(&mainThreadOnceToken, ^{
        dispatch_queue_t queue = dispatch_get_main_queue();
        instanceOfMainThreadQueue
        = [[WWSemaphoreQueue alloc] initWithQueue:queue numberOfConcurrent:4];
    });
    return instanceOfMainThreadQueue;
}



/******************************************************************************/
/**** Service - Global Queue Service                                       ****/
/******************************************************************************/
#pragma mark - Service - Global Queue Service


+ (id<WWDispatchQueue>)highGlobalQueue
{
    static id<WWDispatchQueue> instanceOfHighGlobalQueue = nil;
    static dispatch_once_t highGlobalOnceToken;
    dispatch_once(&highGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        instanceOfHighGlobalQueue
        = [[WWSemaphoreQueue alloc] initWithQueue:queue numberOfConcurrent:2];
        instanceOfHighGlobalQueue.queueName = @"high_global_queue";
    });
    return instanceOfHighGlobalQueue;
}

+ (id<WWDispatchQueue>)defaultGlobalQueue
{
    static id<WWDispatchQueue> instanceOfDefaultGlobalQueue = nil;
    static dispatch_once_t defaultGlobalOnceToken;
    dispatch_once(&defaultGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        instanceOfDefaultGlobalQueue
        = [[WWSemaphoreQueue alloc] initWithQueue:queue numberOfConcurrent:4];
        instanceOfDefaultGlobalQueue.queueName = @"default_global_queue";
    });
    return instanceOfDefaultGlobalQueue;
}

+ (id<WWDispatchQueue>)lowGlobalQueue
{
    static id<WWDispatchQueue> instanceOfLowGlobalQueue = nil;
    static dispatch_once_t lowGlobalOnceToken;
    dispatch_once(&lowGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        instanceOfLowGlobalQueue
        = [[WWSemaphoreQueue alloc] initWithQueue:queue numberOfConcurrent:8];
        instanceOfLowGlobalQueue.queueName = @"low_global_queue";
    });
    return instanceOfLowGlobalQueue;
}

+ (id<WWDispatchQueue>)backgroundGlobalQueue
{
    static id<WWDispatchQueue> instanceOfBgGlobalQueue = nil;
    static dispatch_once_t bgGlobalOnceToken;
    dispatch_once(&bgGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        instanceOfBgGlobalQueue
        = [[WWSemaphoreQueue alloc] initWithQueue:queue numberOfConcurrent:4];
        instanceOfBgGlobalQueue.queueName = @"background_global_queue";
    });
    return instanceOfBgGlobalQueue;
}

@end
