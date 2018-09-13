//
//  LFXSuperInvoker.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/11.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFXSuperResult.h"

@interface LFXSuperInvoker : NSObject

/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method
- (LFXSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                               arguments:(NSArray *)arguments;



/******************************************************************************/
/**** Service - Dynamic Invoke Instance Method                             ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Instance Method

// invoke instance method
- (LFXSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                  arguments:(NSArray *)arguments;




/******************************************************************************/
/**** Utility - Get Class/Instance Invocation Method                       ****/
/******************************************************************************/
#pragma mark - Utility - Get Class/Instance Invocation Method

- (BOOL)checkMethodSignature:(NSMethodSignature *)signature
                   withClass:(Class)aClass
                withSelector:(SEL)aAction
               withArguments:(NSArray *)arguments;

- (void)handleArguments:(NSArray *)arguments ofInvocation:(NSInvocation *)aInvocation;

- (LFXSuperResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation;



/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance;

- (instancetype)init;

@end
