//
//  WWTaskQueue.h
//  WWFoundation
//
//  Created by Shines Young on 2018/9/24.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWTaskQueue : NSObject


- (instancetype)initWithQueue:(dispatch_queue_t)targetQueue
            numberOfConcurrnt:(NSUInteger)numberOfConcurrent;

@end
