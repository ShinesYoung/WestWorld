//
//  WWSuperInvoker.m
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWSuperInvoker.h"




@implementation WWSuperInvoker


/******************************************************************************/
/**** Service - Dynamic Invoke Class Method                                ****/
/******************************************************************************/
#pragma mark - Service - Dynamic Invoke Class Method

// invoke class method

- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
{
    return [self callInvocationOfClass:aClass method:aAction arguments:@[]];
}

- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                                safeArgs:(WWArguments *)safeArgs
{
    return [self callInvocationOfClass:aClass method:aAction
                             arguments:[safeArgs.arguments copy]];
}

// primitive method
- (WWSuperResult *)callInvocationOfClass:(Class)aClass method:(SEL)aAction
                               arguments:(NSArray *)arguments
{
    // 0.保持nil指针特性
    if (aClass == nil) { return nil;}
    
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

- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
{
    return [self callInvocationOfInstance:aTarget method:aAction arguments:@[]];
}

- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                   safeArgs:(WWArguments *)safeArgs
{
    return [self callInvocationOfClass:aTarget method:aAction
                             arguments:[safeArgs.arguments copy]];
}

// primitive method
- (WWSuperResult *)callInvocationOfInstance:(id)aTarget method:(SEL)aAction
                                  arguments:(NSArray *)arguments
{
    // 0.保持nil指针特性
    if (aTarget == nil) { return nil;}
    
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
        const char *aArgTypeOfSignature
        = [aInvocation.methodSignature getArgumentTypeAtIndex:index+2];
        
        if ([aArgument isKindOfClass:[NSNull class]]) {
            aArgument = nil;
            [aInvocation setArgument:&aArgument atIndex:index+2];
        }
        else if ([aArgument isKindOfClass:[NSNumber class]])
        {
            NSNumber *numberArg = (NSNumber *)aArgument;
            
            if      (strcmp(aArgTypeOfSignature, @encode(id) ) == 0)
            {
                [aInvocation setArgument:&aArgument atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(BOOL) ) == 0) // bool
            {
                BOOL boolArg = [numberArg boolValue];
                [aInvocation setArgument:&boolArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(float) ) == 0)
            {
                float floatArg = [numberArg floatValue];
                [aInvocation setArgument:&floatArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(double) ) == 0)
            {
                double doubleArg = [numberArg doubleValue];
                [aInvocation setArgument:&doubleArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(int) ) == 0)
            {
                int intArg = [numberArg intValue];
                [aInvocation setArgument:&intArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(unsigned int) ) == 0)
            {
                unsigned int unsignedIntArg = [numberArg unsignedIntValue];
                [aInvocation setArgument:&unsignedIntArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(long) ) == 0)
            {
                long longArg = [numberArg longValue];
                [aInvocation setArgument:&longArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(unsigned long) ) == 0)
            {
                unsigned long unsignedLongArg = [numberArg unsignedLongValue];
                [aInvocation setArgument:&unsignedLongArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(long long) ) == 0)
            {
                long long longLongArg = [numberArg longLongValue];
                [aInvocation setArgument:&longLongArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(unsigned long long) ) == 0)
            {
                unsigned long long unsignedLongLongArg = [numberArg unsignedLongLongValue];
                [aInvocation setArgument:&unsignedLongLongArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(char) ) == 0)
            {
                char charArg = [numberArg charValue];
                [aInvocation setArgument:&charArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(unsigned char) ) == 0)
            {
                unsigned char unsignedCharArg = [numberArg unsignedCharValue];
                [aInvocation setArgument:&unsignedCharArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(short) ) == 0)
            {
                short shortArg = [numberArg shortValue];
                [aInvocation setArgument:&shortArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(unsigned short) ) == 0)
            {
                unsigned short unsignedShortArg = [numberArg unsignedShortValue];
                [aInvocation setArgument:&unsignedShortArg atIndex:index+2];
            }
            else
            {
                [aInvocation setArgument:&aArgument atIndex:index+2];
            }
            
        }
        else if ([aArgument isKindOfClass:[NSValue class]])
        {
            NSValue *aValueArg = (NSValue *)aArgument;
            if      (strcmp(aArgTypeOfSignature, @encode(CGPoint)) == 0)
            {
                CGPoint cgPointArg = [aValueArg CGPointValue];
                [aInvocation setArgument:&cgPointArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(CGSize)) == 0)
            {
                CGSize cgSizeArg = [aValueArg CGSizeValue];
                [aInvocation setArgument:&cgSizeArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(CGVector)) == 0)
            {
                CGVector cgVectorArg = [aValueArg CGVectorValue];
                [aInvocation setArgument:&cgVectorArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(CGRect)) == 0)
            {
                CGRect cgRectArg = [aValueArg CGRectValue];
                [aInvocation setArgument:&cgRectArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(NSRange)) == 0)
            {
                NSRange rangeArg = [aValueArg rangeValue];
                [aInvocation setArgument:&rangeArg atIndex:index+2];
            }
            else if (strcmp(aArgTypeOfSignature, @encode(UIOffset)) == 0)
            {
                UIOffset offsetArg = [aValueArg UIOffsetValue];
                [aInvocation setArgument:&offsetArg atIndex:index+2];
            }
        }
        else
        {
            [aInvocation setArgument:&aArgument atIndex:index+2];
        }
        
    }
    [aInvocation retainArguments];
}


- (WWSuperResult *)checkAndReturnInvocationResult:(NSInvocation *)aInvocation
{
    // method's return type is void
    if (aInvocation.methodSignature.methodReturnLength == 0) {
        return nil;
    }

    NSUInteger resultLength = aInvocation.methodSignature.methodReturnLength;
    const char *retTypeChar = aInvocation.methodSignature.methodReturnType;
    
    NSLog(@"retTypeChar = %s", retTypeChar);
    NSValue *aValue = nil;
    if (strcmp(retTypeChar, @encode(CGPoint)) == 0) {
        CGPoint aPoint = CGPointZero;
        [aInvocation getReturnValue:&aPoint];
        aValue = [NSValue valueWithCGPoint:aPoint];
    }
    else if (strcmp(retTypeChar, @encode(CGSize)) == 0) {
        CGSize aSize = CGSizeZero;
        [aInvocation getReturnValue:&aSize];
        aValue = [NSValue valueWithCGSize:aSize];
    }
    else if (strcmp(retTypeChar, @encode(CGVector)) == 0) {
        CGVector aVector = CGVectorMake(0, 0);;
        [aInvocation getReturnValue:&aVector];
        aValue = [NSValue valueWithCGVector:aVector];
    }
    else if (strcmp(retTypeChar, @encode(CGRect)) == 0) {
        CGRect aRect = CGRectZero;
        [aInvocation getReturnValue:&aRect];
        aValue = [NSValue valueWithCGRect:aRect];
    }
    else if (strcmp(retTypeChar, @encode(NSRange)) == 0) {
        NSRange aRange = NSMakeRange(0, 0);
        [aInvocation getReturnValue:&aRange];
        aValue = [NSValue valueWithRange:aRange];
    }
    else if (strcmp(retTypeChar, @encode(UIOffset)) == 0) {
        UIOffset aOffset = UIOffsetZero;
        [aInvocation getReturnValue:&aOffset];
        aValue = [NSValue valueWithUIOffset:aOffset];
    }
    else {
        const void *resultBuff = (void *)malloc(resultLength);
        [aInvocation getReturnValue:&resultBuff];
        aValue = [NSValue valueWithBytes:&resultBuff objCType:retTypeChar];
    }
    
    WWSuperResult *aResult = [[WWSuperResult alloc] initWithValue:aValue
                                                         objcType:retTypeChar
                                                           length:resultLength];

    return aResult;
}





/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)instance
{
    static WWSuperInvoker *theInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theInstance = [[[WWSuperInvoker class] alloc] init];
    });
    return theInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}


@end
