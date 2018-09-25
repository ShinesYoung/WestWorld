//
//  WWConcurrentManager.m
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWConcurrentManager.h"

@interface WWConcurrentManager ()

@end


@implementation WWConcurrentManager

/******************************************************************************/
/**** System - Lifecycle & Constructor                                     ****/
/******************************************************************************/
#pragma mark - System - Lifecycle & Constructor

+ (WWTaskQueue *)mainThreadQueue
{
    static WWTaskQueue *instanceOfMainThreadQueue = nil;
    static dispatch_once_t mainThreadOnceToken;
    dispatch_once(&mainThreadOnceToken, ^{
        dispatch_queue_t queue = dispatch_get_main_queue();
        instanceOfMainThreadQueue
        = [[WWTaskQueue alloc] initWithQueue:queue numberOfConcurrent:4];
    });
    return instanceOfMainThreadQueue;
}



/******************************************************************************/
/**** Service - Global Queue Service                                       ****/
/******************************************************************************/
#pragma mark - Service - Global Queue Service


+ (WWTaskQueue *)highGlobalQueue
{
    static WWTaskQueue *instanceOfHighGlobalQueue = nil;
    static dispatch_once_t highGlobalOnceToken;
    dispatch_once(&highGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        instanceOfHighGlobalQueue
        = [[WWTaskQueue alloc] initWithQueue:queue numberOfConcurrent:2];
    });
    return instanceOfHighGlobalQueue;
}

+ (WWTaskQueue *)defaultGlobalQueue
{
    static WWTaskQueue *instanceOfDefaultGlobalQueue = nil;
    static dispatch_once_t defaultGlobalOnceToken;
    dispatch_once(&defaultGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        instanceOfDefaultGlobalQueue
        = [[WWTaskQueue alloc] initWithQueue:queue numberOfConcurrent:4];
    });
    return instanceOfDefaultGlobalQueue;
}

+ (WWTaskQueue *)lowGlobalQueue
{
    static WWTaskQueue *instanceOfLowGlobalQueue = nil;
    static dispatch_once_t lowGlobalOnceToken;
    dispatch_once(&lowGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        instanceOfLowGlobalQueue
        = [[WWTaskQueue alloc] initWithQueue:queue numberOfConcurrent:8];
    });
    return instanceOfLowGlobalQueue;
}

+ (WWTaskQueue *)backgroundGlobalQueue
{
    static WWTaskQueue *instanceOfBgGlobalQueue = nil;
    static dispatch_once_t bgGlobalOnceToken;
    dispatch_once(&bgGlobalOnceToken, ^{
        dispatch_queue_t queue
        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        instanceOfBgGlobalQueue
        = [[WWTaskQueue alloc] initWithQueue:queue numberOfConcurrent:4];
    });
    return instanceOfBgGlobalQueue;
}

@end
