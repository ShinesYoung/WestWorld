//
//  WWConcurrentManager.h
//  WWFoundation
//
//  Created by 杨善嗣 on 2018/9/21.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWDispatchQueue.h"


NS_ASSUME_NONNULL_BEGIN

@interface WWConcurrentManager : NSObject

/******************************************************************************/
/**** Service - Main Queue Service                                         ****/
/******************************************************************************/
#pragma mark - Service - Main Queue Service

+ (id<WWDispatchQueue>)mainThreadQueue;



/******************************************************************************/
/**** Service - Global Queue Service                                       ****/
/******************************************************************************/
#pragma mark - Service - Global Queue Service

+ (id<WWDispatchQueue>)highGlobalQueue;
+ (id<WWDispatchQueue>)defaultGlobalQueue;
+ (id<WWDispatchQueue>)lowGlobalQueue;
+ (id<WWDispatchQueue>)backgroundGlobalQueue;

@end

NS_ASSUME_NONNULL_END
