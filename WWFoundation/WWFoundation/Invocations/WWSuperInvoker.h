//
//  WWSuperInvoker.h
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WWArguments.h"
#import "WWSuperResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWSuperInvoker : NSObject

/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method
- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction;
- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                                safeArgs:(WWArguments *)safeArgs;
- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                               arguments:(NSArray *)arguments;



/******************************************************************************/
/**** Service - Dynamic Invoke Instance Method                             ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Instance Method

// invoke instance method
- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction;
- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                  safeArgs:(WWArguments *)safeArgs;
- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
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

- (WWSuperResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation;



/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
