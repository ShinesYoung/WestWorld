//
//  WWConcurrentManager.h
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWTaskQueue.h"

@interface WWConcurrentManager : NSObject

/******************************************************************************/
/**** Service - Main Queue Service                                         ****/
/******************************************************************************/
#pragma mark - Service - Main Queue Service

+ (WWTaskQueue *)mainThreadQueue;



/******************************************************************************/
/**** Service - Global Queue Service                                       ****/
/******************************************************************************/
#pragma mark - Service - Global Queue Service

+ (WWTaskQueue *)highGlobalQueue;
+ (WWTaskQueue *)defaultGlobalQueue;
+ (WWTaskQueue *)lowGlobalQueue;
+ (WWTaskQueue *)backgroundGlobalQueue;





@end
