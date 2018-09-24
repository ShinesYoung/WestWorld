//
//  WWConcurrentManager.h
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWTaskQueue.h"

@interface WWConcurrentManager : NSObject

/******************************************************************************/
/**** Service - Main Queue Service                                         ****/
/******************************************************************************/
#pragma mark - Service - Main Queue Service

+ (WWTaskQueue *)mainQueue;
+ (WWTaskQueue *)highGlobalQueue;
+ (WWTaskQueue *)defaultGlobalQueue;
+ (WWTaskQueue *)lowGlobalQueue;
+ (WWTaskQueue *)backgroundGlobalQueue;


/******************************************************************************/
/**** Service - Concurrent Service                                         ****/
/******************************************************************************/
#pragma mark - Service - Concurrent Service




- (void)async:(dispatch_block_t)aTask;
- (void)sync:(dispatch_block_t)aTask;


/******************************************************************************/
/**** Private - Helper Function                                            ****/
/******************************************************************************/
#pragma mark - Private - Helper Function

- (dispatch_queue_t)nextCandidate;



/******************************************************************************/
/**** System - Lifecycle & Constructor                                     ****/
/******************************************************************************/
#pragma mark - System - Lifecycle & Constructor

+ (instancetype)defaultManager;



@end
