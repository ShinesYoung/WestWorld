//
//  WWSemaphoreQueue.m
//  WWFoundation
//
//  Created by Shines Young on 2018/9/24.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWSemaphoreQueue.h"



@interface WWSemaphoreQueue()

@property (nonatomic, assign) NSUInteger numberOfConcurrent;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_queue_t workQueue;
@property (nonatomic, strong) dispatch_queue_t waitingQueue;


@end


@implementation WWSemaphoreQueue

/******************************************************************************/
/**** Service - Dispatch Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Dispatch Function

//同步
- (void)sync:(dispatch_block_t)aTaskBlock {
    
    if (!aTaskBlock) { return; }
    
    dispatch_sync(self.waitingQueue,^{
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);  //semaphore - 1
        dispatch_sync(self.workQueue,^{
            if (aTaskBlock) {
                aTaskBlock();
            }
            dispatch_semaphore_signal(self.semaphore);  //semaphore + 1
        });
    });
}

//异步
- (void)async:(dispatch_block_t)aTaskBlock {
    
    if (!aTaskBlock) { return; }
    
    dispatch_async(self.waitingQueue,^{
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);  //semaphore - 1
        dispatch_async(self.workQueue,^{
            if (aTaskBlock) {
                aTaskBlock();
            }
            dispatch_semaphore_signal(self.semaphore);  //semaphore + 1
        });
    });
}

- (void)barrier:(dispatch_block_t)aTaskBlock
{
    dispatch_async(self.waitingQueue,^{
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);  //semaphore - 1
        dispatch_barrier_async(self.workQueue,^{
            if (aTaskBlock) {
                aTaskBlock();
            }
            dispatch_semaphore_signal(self.semaphore);  //semaphore + 1
        });
    });
}




/******************************************************************************/
/**** System - Constructor & Lifecycle                                     ****/
/******************************************************************************/
#pragma mark - System - Constructor & Lifecycle

- (instancetype)init
{
    dispatch_queue_t queue
    = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    return [self initWithQueue:queue numberOfConcurrent:kDefaultNumberOfConcurrent];
}

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
{
    return [self initWithQueue:targetQueue numberOfConcurrent:kDefaultNumberOfConcurrent];
}

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
           numberOfConcurrent:(NSUInteger)numberOfConcurrent
{
    self = [super init];
    if (self) {
        self.workQueue = targetQueue;
        self.numberOfConcurrent = numberOfConcurrent;
        self.semaphore = dispatch_semaphore_create(numberOfConcurrent);
        self.waitingQueue = dispatch_queue_create("net.shines.westword.waitingQ",
                                                  DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

@end
