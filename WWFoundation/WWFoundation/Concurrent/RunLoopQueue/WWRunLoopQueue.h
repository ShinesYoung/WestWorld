//
//  WWRunLoopQueue.h
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWDispatchQueue.h"
#import "WWRunLoopThread.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWRunLoopQueue : NSObject <WWDispatchQueue>

@property (nonatomic, copy) NSString *queueName;
@property (nonatomic, assign, readonly) NSUInteger maxNumberOfConcurrent;

/******************************************************************************/
/**** Service - Dispatch Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Dispatch Function

- (void)sync:(dispatch_block_t)aTaskBlock;
- (void)async:(dispatch_block_t)aTaskBlock;
- (void)barrier:(dispatch_block_t)aTaskBlock;


/******************************************************************************/
/**** Service - Manager Function                                          ****/
/******************************************************************************/
#pragma mark - Service - Manager Function

- (void)start;
- (void)stop;


/******************************************************************************/
/**** System - Constructor & Lifecycle                                     ****/
/******************************************************************************/
#pragma mark - System - Constructor & Lifecycle

- (instancetype)init;
- (instancetype)initWithMaxNumberOfConcurrent:(NSUInteger)numberOfConcurrent;

@end

NS_ASSUME_NONNULL_END
