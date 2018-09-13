//
//  SomeObject.m
//  SingleSimpleSample
//
//  Created by 杨善嗣 on 2018/9/12.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "SomeObject.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation SomeObject

- (id)methodObject
{
    return @"OK";
}

- (BOOL)methodBool
{
    return YES;
}

- (char)methodChar
{
    return 'p';
}

- (unsigned char)methodUnsignedChar
{
    return 'G';
}

- (short)methodShort
{
    return -12;
}

- (unsigned short)methodUnsignedShort
{
    return 12;
}

- (int)methodInt
{
    return -15;
}

- (unsigned int)methodUnsignedInt
{
    return 20;
}

- (long)methodLong
{
    return -1999;
}

- (unsigned long)methodUnsignedLong
{
    return 200099;
}

- (long long)methodLongLong
{
    long long theValue = -1234567890;
    if (theValue > LONG_LONG_MAX) {
        NSLog(@"===> long long value out of long long MAX");
    }
    return theValue;
}

- (unsigned long long)methodUnsignedLongLong
{
    unsigned long long theValue = 1234567890;
    if (theValue > ULONG_LONG_MAX) {
        NSLog(@"===> long long value out of unsigned long long MAX");
    }
    return theValue;
}


- (NSInteger)methodInteger
{
    return -1234567890;
}

- (NSUInteger)methodUnsignedInteger
{
    return 1234567890;
}

- (float)methodFloat
{
    return 1.222333;
}

- (double)methodDouble
{
    return 9.999999;
}

- (void)methodVoid
{
    NSLog(@"method Void called");
}


@end
