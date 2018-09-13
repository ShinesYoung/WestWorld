//
//  LFXSuperInvoker.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/11.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFXSuperResult.h"


NS_ASSUME_NONNULL_BEGIN

@interface LFXSuperInvoker : NSObject

/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method
- (LFXSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                               arguments:(NSArray *_Nullable)arguments;



/******************************************************************************/
/**** Service - Dynamic Invoke Instance Method                             ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Instance Method

// invoke instance method
- (LFXSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                  arguments:(NSArray *_Nullable)arguments;




/******************************************************************************/
/**** Utility - Get Class/Instance Invocation Method                       ****/
/******************************************************************************/
#pragma mark - Utility - Get Class/Instance Invocation Method

- (BOOL)checkMethodSignature:(NSMethodSignature *)signature
                   withClass:(Class)aClass
                withSelector:(SEL)aAction
               withArguments:(NSArray * _Nullable)arguments;

- (void)handleArguments:(NSArray *_Nullable)arguments ofInvocation:(NSInvocation *)aInvocation;

- (LFXSuperResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation;



/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance;

- (instancetype)init;

@end


NS_ASSUME_NONNULL_END
