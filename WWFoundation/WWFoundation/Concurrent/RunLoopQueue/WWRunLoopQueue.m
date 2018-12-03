//
//  WWRunLoopQueue.m
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWRunLoopQueue.h"

@interface WWRunLoopQueue ()

@property (nonatomic, strong, readonly) NSMutableArray *waitingQueue;
@property (nonatomic, strong, readonly) NSMutableArray *threadPool;

@end



@implementation WWRunLoopQueue

/******************************************************************************/
/**** Service - Dispatch Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Dispatch Function

- (void)sync:(dispatch_block_t)aTaskBlock
{
    
}

- (void)async:(dispatch_block_t)aTaskBlock
{
    
}

- (void)barrier:(dispatch_block_t)aTaskBlock
{
    
}



/******************************************************************************/
/**** Service - Manager Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Manager Function

- (void)start
{
    for (NSThread *aThread in self.threadPool) {
        if ([aThread isExecuting] == NO) {
            [aThread start];
        }
    }
}

- (void)stop
{
    for (WWRunLoopThread *aThread in self.threadPool) {
        if ([aThread isExecuting] == YES) {
            CFRunLoopStop(aThread.runLoop.getCFRunLoop);
            [NSThread exit];
        }
    }
}



/******************************************************************************/
/**** System - Constructor & Lifecycle                                     ****/
/******************************************************************************/
#pragma mark - System - Constructor & Lifecycle

- (instancetype)init
{
    return [self initWithMaxNumberOfConcurrent:kDefaultNumberOfConcurrent];
}

- (instancetype)initWithMaxNumberOfConcurrent:(NSUInteger)numberOfConcurrent
{
    self = [super init];
    if (self) {
        self->_maxNumberOfConcurrent = numberOfConcurrent;
        self->_waitingQueue = [NSMutableArray arrayWithCapacity:1024];
        self->_threadPool = [NSMutableArray arrayWithCapacity:self.maxNumberOfConcurrent];
        
        for (NSUInteger index=0; index < numberOfConcurrent; index ++)
        {
            WWRunLoopThread *aWorkThread = [[WWRunLoopThread alloc] init];
            aWorkThread.name = [NSString stringWithFormat:@"RunLoop Worker %luld", index];
            [self.threadPool addObject:aWorkThread];
        }
    }
    return self;
}

- (void)dealloc
{
    self->_waitingQueue = nil;
    self->_threadPool = nil;
}

@end
