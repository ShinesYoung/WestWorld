//
//  WWRunLoopThread.h
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWRunLoopThread : NSThread

@property (nonatomic, strong) NSRunLoop *runLoop;

@end
