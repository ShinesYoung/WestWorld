//
//  WWSuperInvoker.h
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WWInvokeArgus.h"
#import "WWInvokeResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWSuperInvoker : NSObject

/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method
- (WWInvokeResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction;
- (WWInvokeResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                              invokeArgus:(WWInvokeArgus *)invokeArgus;
- (WWInvokeResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                                arguments:(NSArray *)arguments;



/******************************************************************************/
/**** Service - Dynamic Invoke Instance Method                             ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Instance Method

// invoke instance method
- (WWInvokeResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction;
- (WWInvokeResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                 invokeArgus:(WWInvokeArgus *)invokeArgus;
- (WWInvokeResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
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

- (WWInvokeResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation;



/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
