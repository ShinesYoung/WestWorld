//
//  WWDispatchQueueImp.m
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/25.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWDispatchQueueImp.h"

@interface WWDispatchQueueImp ()

@property (nonatomic, assign) NSUInteger numberOfConcurrent;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, strong) dispatch_queue_t serialQueue;
@property (nonatomic, strong) NSMutableArray *threadPool;

@end


@implementation WWDispatchQueueImp

- (void)sync:(dispatch_block_t)aTaskBlock
{
    if (!aTaskBlock) { return; }
    
    dispatch_sync(self.serialQueue,^{
        dispatch_queue_t workQueue = [self next];
        dispatch_sync(workQueue,^{
            if (aTaskBlock) { aTaskBlock(); }
        });
    });
}

- (void)async:(dispatch_block_t)aTaskBlock
{
    if (!aTaskBlock) { return; }
    
    dispatch_async(self.serialQueue,^{
        dispatch_queue_t workQueue = [self next];
        dispatch_async(workQueue,^{
            if (aTaskBlock) { aTaskBlock(); }
        });
    });
}

- (void)barrier:(dispatch_block_t)aTaskBlock
{
    if (!aTaskBlock) { return; }
    
    
}

- (dispatch_queue_t)next
{
    NSUInteger nextIndex = (self.currentIndex + 1) % self.numberOfConcurrent;
    dispatch_queue_t next = self.threadPool[nextIndex];
    self.currentIndex = nextIndex;
    return next;
}


/******************************************************************************/
/**** System - Constructor & Lifecycle                                     ****/
/******************************************************************************/
#pragma mark - System - Constructor & Lifecycle

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
{
    return nil;
}

- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
           numberOfConcurrent:(NSUInteger)numberOfConcurrent
{
    self = [super init];
    if (self) {
        self.numberOfConcurrent = numberOfConcurrent;
        self.serialQueue = dispatch_queue_create("net.shines.westword.serialQ",
                                                 DISPATCH_QUEUE_SERIAL);
        self.threadPool = [NSMutableArray array];
        for (NSUInteger index=0; index<self.numberOfConcurrent; index++)
        {
            NSString *label = [NSString stringWithFormat:@"net.shines.westword.serialWorkQ-%ld", index];
            const char* queueLabel = [label cStringUsingEncoding:(NSUTF8StringEncoding)];
            
            dispatch_queue_attr_t queueAttribute =
            dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL,
                                                    QOS_CLASS_DEFAULT,
                                                    DISPATCH_QUEUE_PRIORITY_LOW);
            dispatch_queue_t aSerialQueue
            = dispatch_queue_create(queueLabel, queueAttribute);
            [self.threadPool addObject:aSerialQueue];
        }
    }
    return self;
}


@end
