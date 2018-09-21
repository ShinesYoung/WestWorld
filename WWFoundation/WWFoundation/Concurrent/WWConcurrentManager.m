//
//  WWConcurrentManager.m
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWConcurrentManager.h"

@interface WWConcurrentManager ()

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;
@property (nonatomic, strong) dispatch_queue_t serialQueue;
@property (nonatomic, strong) NSMutableArray *threadPool;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, assign) NSUInteger sizeOfThreadPool;

@end


@implementation WWConcurrentManager



/******************************************************************************/
/**** Service - Concurrent Service                                         ****/
/******************************************************************************/
#pragma mark - Service - Concurrent Service

- (void)async:(dispatch_block_t)aTask
{
    dispatch_queue_t aCandidate = [self nextCandidate];
    dispatch_sync(aCandidate, aTask);
}

- (void)sync:(dispatch_block_t)aTask
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, aTask);
}




/******************************************************************************/
/**** Private - Helper Function                                            ****/
/******************************************************************************/
#pragma mark - Private - Helper Function

- (dispatch_queue_t)nextCandidate
{
    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    NSUInteger nextIndex = (self.currentIndex +1)%self.sizeOfThreadPool;
    dispatch_queue_t aSerialQueue = self.threadPool[nextIndex];
    self.currentIndex = nextIndex;

    dispatch_semaphore_signal(sem);

    return aSerialQueue;
    
}



/******************************************************************************/
/**** System - Lifecycle & Constructor                                     ****/
/******************************************************************************/
#pragma mark - System - Lifecycle & Constructor

+ (instancetype)defaultManager
{
    static WWConcurrentManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WWConcurrentManager alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.threadPool = [NSMutableArray array];
        self.sizeOfThreadPool = 10;
        self.currentIndex = 0;
        
        for (NSUInteger index=0; index<self.sizeOfThreadPool; index ++)
        {
            NSString *queueId = [NSString stringWithFormat:@"WW_SERIAL_QUEUE_%ld", index];
            const char* queueLabel = [queueId cStringUsingEncoding:(NSUTF8StringEncoding)];
            dispatch_queue_t aSerialQueue
            = dispatch_queue_create(queueLabel, DISPATCH_QUEUE_SERIAL);
            [self.threadPool addObject:aSerialQueue];
        }
    }
    return self;
}


@end
