//
//  WWRunLoopThread.m
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWRunLoopThread.h"


@implementation WWRunLoopThread

- (void)main
{
    @autoreleasepool {
        self.runLoop = [NSRunLoop currentRunLoop];
        [self.runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [self.runLoop run];
    }
}

@end
