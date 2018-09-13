//
//  LFXSuperInvoker.m
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/11.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import "LFXSuperInvoker.h"




@implementation LFXSuperInvoker


/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method
- (LFXSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                               arguments:(NSArray *)arguments
{
    // 1.获取methodSignature
    NSMethodSignature *signature = [aClass methodSignatureForSelector:aAction];
    
    [self checkMethodSignature:signature withClass:aClass
                  withSelector:aAction withArguments:arguments];
    
    // 2.get invocation for Class's Method
    NSInvocation *aInvocation
    = [NSInvocation invocationWithMethodSignature:signature];
    aInvocation.target = aClass;
    aInvocation.selector = aAction;
    
    // 3.set arguments
    [self handleArguments:arguments ofInvocation:aInvocation];
    
    // 4.call invocation
    [aInvocation invoke];
    
    // 5.check return type, if return type is void then return nil.
    return [self checkAndReturnInvocationResult:aInvocation];
}




/******************************************************************************/
/**** Service - Dynamic Invoke Instance Method                             ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Instance Method

// invoke instance method

- (LFXSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                  arguments:(NSArray *)arguments
{
    // 1.获取methodSignature
    Class classOfTarget = [aTarget class];
    NSMethodSignature *signature
    = [classOfTarget instanceMethodSignatureForSelector:aAction];
    
    [self checkMethodSignature:signature withClass:classOfTarget
                  withSelector:aAction withArguments:arguments];
    
    // 2.get invocation for object's Method
    NSInvocation *aInvocation
    = [NSInvocation invocationWithMethodSignature:signature];
    aInvocation.target = aTarget;
    aInvocation.selector = aAction;

    // 3.set arguments
    [self handleArguments:arguments ofInvocation:aInvocation];
    
    // 4.call invocation
    [aInvocation invoke];
    
    // 5.check return type, if return type is void then return nil.
    return [self checkAndReturnInvocationResult:aInvocation];
}







/******************************************************************************/
/**** Utility - Get Class/Instance Invocation Method                       ****/
/******************************************************************************/
#pragma mark - Utility - Get Class/Instance Invocation Method

- (BOOL)checkMethodSignature:(NSMethodSignature *)signature
                   withClass:(Class)aClass
                withSelector:(SEL)aAction
               withArguments:(NSArray *)arguments
{
    // 方法不存在
    if (signature == nil)
    {
        NSString *reason = [NSString stringWithFormat:@"Unknown selector of %@",
                            NSStringFromClass(aClass)];
        @throw [NSException exceptionWithName:@"Dynamic Invoke Error"
                                       reason:reason
                                     userInfo:nil];
        return NO;
    }
    return YES;
}

- (void)handleArguments:(NSArray *)arguments ofInvocation:(NSInvocation *)aInvocation
{
    // check whether the number of method's arguments is equals to input arguments.
    NSUInteger countOfInputArgs  = arguments.count;
    NSUInteger countOfSignArgs = aInvocation.methodSignature.numberOfArguments;
    if (countOfInputArgs != countOfSignArgs -2)
    {
        NSString *reason = [NSString stringWithFormat:
                            @"+[%@ %@] need input %lu args, but get %lu.",
                            NSStringFromClass([aInvocation.target class]),
                            NSStringFromSelector(aInvocation.selector),
                            countOfSignArgs-2, arguments.count];
        @throw [NSException exceptionWithName:@"Dynamic Invoke Error"
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    
    // func(id,SEL,...)，前2个参数已被系统预订，从第3个参数开始设置
    for (NSUInteger index=0; index<countOfSignArgs -2; index++)
    {
        // 获取当前参数
        id aArgument = arguments[index];
        
        // 取出方法要求的参数类型，将传递进来的参数进行匹配
        const char *aSignArgType
        = [aInvocation.methodSignature getArgumentTypeAtIndex:index+2];
        
        if ([aArgument isKindOfClass:[NSNull class]]) {
            aArgument = nil;
            [aInvocation setArgument:&aArgument atIndex:index+2];
        }
        else if ([aArgument isKindOfClass:[NSNumber class]])
        {
            NSNumber *numberArg = (NSNumber *)aArgument;
            
            if      (strcmp(aSignArgType, @encode(id) ) == 0)
            {
                [aInvocation setArgument:&aArgument atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(BOOL) ) == 0) // bool
            {
                BOOL boolArg = [numberArg boolValue];
                [aInvocation setArgument:&boolArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(NSInteger) ) == 0)
            {
                NSInteger integerArg = [numberArg integerValue];
                [aInvocation setArgument:&integerArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(NSUInteger) ) == 0)
            {
                NSUInteger unsignedIntegerArg = [numberArg unsignedIntegerValue];
                [aInvocation setArgument:&unsignedIntegerArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(float) ) == 0)
            {
                float floatArg = [numberArg floatValue];
                [aInvocation setArgument:&floatArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(double) ) == 0)
            {
                double doubleArg = [numberArg doubleValue];
                [aInvocation setArgument:&doubleArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(char) ) == 0)
            {
                char charArg = [numberArg charValue];
                [aInvocation setArgument:&charArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(unsigned char) ) == 0)
            {
                unsigned char unsignedCharArg = [numberArg unsignedCharValue];
                [aInvocation setArgument:&unsignedCharArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(short) ) == 0)
            {
                short shortArg = [numberArg shortValue];
                [aInvocation setArgument:&shortArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(unsigned short) ) == 0)
            {
                unsigned short unsignedShortArg = [numberArg unsignedShortValue];
                [aInvocation setArgument:&unsignedShortArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(int) ) == 0)
            {
                int intArg = [numberArg intValue];
                [aInvocation setArgument:&intArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(unsigned int) ) == 0)
            {
                unsigned int unsignedIntArg = [numberArg unsignedIntValue];
                [aInvocation setArgument:&unsignedIntArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(long) ) == 0)
            {
                long longArg = [numberArg longValue];
                [aInvocation setArgument:&longArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(unsigned long) ) == 0)
            {
                unsigned long unsignedLongArg = [numberArg unsignedLongValue];
                [aInvocation setArgument:&unsignedLongArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(long long) ) == 0)
            {
                long long longLongArg = [numberArg longLongValue];
                [aInvocation setArgument:&longLongArg atIndex:index+2];
            }
            else if (strcmp(aSignArgType, @encode(unsigned long long) ) == 0)
            {
                unsigned long long unsignedLongLongArg = [numberArg unsignedLongLongValue];
                [aInvocation setArgument:&unsignedLongLongArg atIndex:index+2];
            }
            else
            {
                [aInvocation setArgument:&aArgument atIndex:index+2];
            }
            
        }
        else
        {
            [aInvocation setArgument:&aArgument atIndex:index+2];
        }
        
    }
    [aInvocation retainArguments];
}


- (LFXSuperResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation
{
    // method's return type is void
    if (aInvocation.methodSignature.methodReturnLength == 0) {
        return nil;
    }
    
    
    NSUInteger resultLength = aInvocation.methodSignature.methodReturnLength;
    void *result = (void *)malloc(resultLength);
    [aInvocation getReturnValue:&result];
    
    LFXSuperResult *aResult = [[LFXSuperResult alloc] init];
    const char *retTypeChar = aInvocation.methodSignature.methodReturnType;
    
    if (strcmp(retTypeChar, @encode(id)) == 0) {
        aResult.objectValue = (__bridge id)result;
    }
    if (strcmp(retTypeChar, @encode(BOOL)) == 0) {
        aResult.boolValue = (BOOL)result;
    }
    if (strcmp(retTypeChar, @encode(char)) == 0) {
        aResult.charValue = (char)result;
    }
    if (strcmp(retTypeChar, @encode(unsigned char)) ==0 ) {
        aResult.unsignedCharValue = (unsigned char)result;
    }
    if (strcmp(retTypeChar, @encode(short)) == 0) {
        aResult.shortValue = (short)result;
    }
    if (strcmp(retTypeChar, @encode(unsigned short)) ==0 ) {
        aResult.unsignedShortValue = (unsigned short)result;
    }
    if (strcmp(retTypeChar, @encode(int)) == 0) {
        aResult.intValue = (int)result;
    }
    if (strcmp(retTypeChar, @encode(unsigned int)) == 0) {
        aResult.unsignedIntValue = (unsigned int)result;
    }
    if (strcmp(retTypeChar, @encode(long)) == 0) {
        aResult.longValue = (long)result;
    }
    if (strcmp(retTypeChar, @encode(unsigned long)) == 0) {
        aResult.unsignedLongValue = (unsigned long)result;
    }
    if (strcmp(retTypeChar, @encode(long long)) == 0) {
        long long longLongResult = 0;
        [aInvocation getReturnValue:&longLongResult];
        aResult.longLongValue = longLongResult;
    }
    if (strcmp(retTypeChar, @encode(unsigned long long)) == 0) {
        unsigned long long unsignedLongLongResult = 0;
        [aInvocation getReturnValue:&unsignedLongLongResult];
        aResult.unsignedLongLongValue = unsignedLongLongResult;
    }
    if (strcmp(retTypeChar, @encode(float)) == 0) {
        float floatResult = 0.0f;
        [aInvocation getReturnValue:&floatResult];
        aResult.floatValue = floatResult;
    }
    if (strcmp(retTypeChar, @encode(double)) == 0) {
        double doubleResult = 0.0f;
        [aInvocation getReturnValue:&doubleResult];
        aResult.doubleValue = doubleResult;
    }
    if (strcmp(retTypeChar, @encode(NSInteger)) == 0) {
        NSInteger integerResult = 0;
        [aInvocation getReturnValue:&integerResult];
        aResult.integerValue = integerResult;
    }
    if (strcmp(retTypeChar, @encode(NSUInteger)) == 0) {
        NSUInteger unsignedIntegerResult = 0;
        [aInvocation getReturnValue:&unsignedIntegerResult];
        aResult.unsignedIntegerValue = unsignedIntegerResult;
    }
    
    return aResult;
}





/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance
{
    static LFXSuperInvoker *theInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theInstance = [[LFXSuperInvoker alloc] init];
    });
    return theInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}


@end
