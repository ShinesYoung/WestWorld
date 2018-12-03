//
//  WWSemaphoreQueue.h
//  WWFoundation
//
//  Created by Shines Young on 2018/9/24.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWDispatchQueue.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWSemaphoreQueue : NSObject <WWDispatchQueue>

@property (nonatomic, copy) NSString *queueName;


/******************************************************************************/
/**** Service - Dispatch Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Dispatch Function


- (void)sync:(dispatch_block_t)aTaskBlock;
- (void)async:(dispatch_block_t)aTaskBlock;
- (void)barrier:(dispatch_block_t)aTaskBlock;



/******************************************************************************/
/**** System - Constructor & Lifecycle                                     ****/
/******************************************************************************/
#pragma mark - System - Constructor & Lifecycle

- (instancetype)init;

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue;

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
           numberOfConcurrent:(NSUInteger)numberOfConcurrent;

@end

NS_ASSUME_NONNULL_END
