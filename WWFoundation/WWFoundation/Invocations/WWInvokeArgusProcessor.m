//
//  WWInvokeArgusProcessor.m
//  WWFoundation
//
//  Created by Shines Young on 2018/12/5.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWInvokeArgusProcessor.h"

@implementation WWInvokeArgusProcessor

+ (void)handleInvocation:(NSInvocation *)aInvocation
               arguCType:(const char *)arguCType
                argument:(id)aArgument
                 atIndex:(NSUInteger)index
{
    if ([aArgument isKindOfClass:[NSNull class]]) {
        aArgument = nil;
        [aInvocation setArgument:&aArgument atIndex:index];
    }
    else if ([aArgument isKindOfClass:[NSNumber class]])
    {
        NSNumber *numberArg = (NSNumber *)aArgument;
        
        if      (strcmp(arguCType, @encode(id) ) == 0)
        {
            [aInvocation setArgument:&aArgument atIndex:index];
        }
        else if (strcmp(arguCType, @encode(BOOL) ) == 0) // bool
        {
            BOOL boolArg = [numberArg boolValue];
            [aInvocation setArgument:&boolArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(float) ) == 0)
        {
            float floatArg = [numberArg floatValue];
            [aInvocation setArgument:&floatArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(double) ) == 0)
        {
            double doubleArg = [numberArg doubleValue];
            [aInvocation setArgument:&doubleArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(int) ) == 0)
        {
            int intArg = [numberArg intValue];
            [aInvocation setArgument:&intArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(unsigned int) ) == 0)
        {
            unsigned int unsignedIntArg = [numberArg unsignedIntValue];
            [aInvocation setArgument:&unsignedIntArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(long) ) == 0)
        {
            long longArg = [numberArg longValue];
            [aInvocation setArgument:&longArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(unsigned long) ) == 0)
        {
            unsigned long unsignedLongArg = [numberArg unsignedLongValue];
            [aInvocation setArgument:&unsignedLongArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(long long) ) == 0)
        {
            long long longLongArg = [numberArg longLongValue];
            [aInvocation setArgument:&longLongArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(unsigned long long) ) == 0)
        {
            unsigned long long unsignedLongLongArg = [numberArg unsignedLongLongValue];
            [aInvocation setArgument:&unsignedLongLongArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(char) ) == 0)
        {
            char charArg = [numberArg charValue];
            [aInvocation setArgument:&charArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(unsigned char) ) == 0)
        {
            unsigned char unsignedCharArg = [numberArg unsignedCharValue];
            [aInvocation setArgument:&unsignedCharArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(short) ) == 0)
        {
            short shortArg = [numberArg shortValue];
            [aInvocation setArgument:&shortArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(unsigned short) ) == 0)
        {
            unsigned short unsignedShortArg = [numberArg unsignedShortValue];
            [aInvocation setArgument:&unsignedShortArg atIndex:index];
        }
        else
        {
            [aInvocation setArgument:&aArgument atIndex:index];
        }
        
    }
    else if ([aArgument isKindOfClass:[NSValue class]])
    {
        NSValue *aValueArg = (NSValue *)aArgument;
        if      (strcmp(arguCType, @encode(CGPoint)) == 0)
        {
            CGPoint cgPointArg = [aValueArg CGPointValue];
            [aInvocation setArgument:&cgPointArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(CGSize)) == 0)
        {
            CGSize cgSizeArg = [aValueArg CGSizeValue];
            [aInvocation setArgument:&cgSizeArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(CGVector)) == 0)
        {
            CGVector cgVectorArg = [aValueArg CGVectorValue];
            [aInvocation setArgument:&cgVectorArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(CGRect)) == 0)
        {
            CGRect cgRectArg = [aValueArg CGRectValue];
            [aInvocation setArgument:&cgRectArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(NSRange)) == 0)
        {
            NSRange rangeArg = [aValueArg rangeValue];
            [aInvocation setArgument:&rangeArg atIndex:index];
        }
        else if (strcmp(arguCType, @encode(UIOffset)) == 0)
        {
            UIOffset offsetArg = [aValueArg UIOffsetValue];
            [aInvocation setArgument:&offsetArg atIndex:index];
        }
    }
    else
    {
        [aInvocation setArgument:&aArgument atIndex:index];
    }
}

@end
