//
//  WWRunLoopThread.m
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWRunLoopThread.h"

@interface WWRunLoopThread ()

@property (atomic, assign) NSTimeInterval lastBeginTimeOfSource;
@property (atomic, assign) NSTimeInterval lastEndTimeOfSource;

@end


@implementation WWRunLoopThread

- (void)main
{
    [super main];
    
    NSLog(@"WWRunLoopThread main() executing...");
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    
    CFRunLoopObserverRef observer
    = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(),
                                         kCFRunLoopAllActivities,
                                         YES, 0,
                                         ^(CFRunLoopObserverRef observer,
                                           CFRunLoopActivity activity)
    {
         switch (activity) {
             case kCFRunLoopEntry:
                 NSLog(@"即将进入runloop");
                 break;
             case kCFRunLoopBeforeTimers:
                 NSLog(@"即将处理timer");
                 break;
             case kCFRunLoopBeforeSources:
                 NSLog(@"即将处理input Sources");
                 self.lastBeginTimeOfSource = CFAbsoluteTimeGetCurrent();
                 break;
             case kCFRunLoopBeforeWaiting:
                 self.lastEndTimeOfSource = CFAbsoluteTimeGetCurrent();
                 NSLog(@"即将睡眠, interval=%.6f",
                       (self.lastEndTimeOfSource - self.lastBeginTimeOfSource));
                 break;
             case kCFRunLoopAfterWaiting:
                 NSLog(@"从睡眠中唤醒，处理完唤醒源之前");
                 break;
             case kCFRunLoopExit:
                 self.lastEndTimeOfSource = CFAbsoluteTimeGetCurrent();
                 NSLog(@"退出, interval=%.6f",
                       (self.lastEndTimeOfSource - self.lastBeginTimeOfSource));
                 break;
             default:
                 break;
         }
     });
    if (observer) {
        CFRunLoopAddObserver(runLoop.getCFRunLoop, observer, kCFRunLoopDefaultMode);
    }
    
    
    while (!self.isCancelled && !self.isFinished)
    {
        @autoreleasepool{
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5, YES);
        }
        NSLog(@"RunLoop checkout >>>>");
    }
    NSLog(@"WWRunLoopThread main() finished");
}

- (void)stop
{
    NSLog(@"WWRunLoopThread stop() executing...");
    if (self.isCancelled || self.isFinished) {
        return;
    }
    //    CFRunLoopStop(CFRunLoopGetCurrent());
    [self cancel];
    NSLog(@"WWRunLoopThread stop() finished");
}

- (void)dealloc
{
    NSLog(@"WWRunLoopThread dealloc <<<<<");
}

@end
