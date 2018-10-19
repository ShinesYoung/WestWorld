//
//  WWDispatchQueue.h
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/25.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSUInteger const kDefaultNumberOfConcurrent = 4;

@protocol WWDispatchQueue <NSObject>

@property (nonatomic, copy) NSString *queueName;

- (void)sync:(dispatch_block_t)aTaskBlock;
- (void)async:(dispatch_block_t)aTaskBlock;
- (void)barrier:(dispatch_block_t)aTaskBlock;

@end
