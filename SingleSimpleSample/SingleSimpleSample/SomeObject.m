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

- (NSString *)moduleName
{
    return @"SomeObject";
}


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

- (void)methodVoidWithString:(NSString *)string
                      number:(NSNumber *)number
                       array:(NSArray *)array
                  dictionary:(NSDictionary *)dictP
                    withBool:(BOOL)boolP
                    withChar:(char)charP withUChar:(unsigned char)uCharP
                     withInt:(int)intP withUInt:(unsigned int)uIntP
                    withLong:(long)longP withULong:(unsigned long)uLongP
                 withInteger:(NSInteger)integerP withUInteger:(NSUInteger)uIntegerP
                   withFloat:(float)floatP withDouble:(double)doubleP
                  withObject:(id)objP
{
    NSLog(@"method Void called !!!");
    NSLog(@"arguments: \n");
    NSLog(@"string: %@", string);
    NSLog(@"number: %@", number);
    NSLog(@"array: %@", array);
    NSLog(@"dictionary: %@", dictP);
    NSLog(@"bool: %d", boolP);
    NSLog(@"char: %c", charP);
    NSLog(@"uChar: %c", uCharP);
    NSLog(@"int: %d", intP);
    NSLog(@"uInt: %d", uIntP);
    NSLog(@"long: %ld", longP);
    NSLog(@"uLong: %lu", uLongP);
    NSLog(@"integer: %ld", integerP);
    NSLog(@"uInteger: %lu", uIntegerP);
    NSLog(@"float: %f", floatP);
    NSLog(@"double: %e", doubleP);
    NSLog(@"object: %@", objP);

}

- (CGSize)methodSize
{
    return CGSizeMake(200, 30);
}

- (CGPoint)methodPoint
{
    return CGPointMake(50, 50);
}

- (CGVector)methodVector
{
    return CGVectorMake(150, 150);
}

- (CGRect)methodRect
{
    return CGRectMake(10, 10, 200, 200);
}

- (NSRange)methodRange
{
    return NSMakeRange(1, 10);
}

- (UIOffset)methodOffset
{
    return UIOffsetMake(1000, 1000);
}

- (void)methodWithSize:(CGSize)size point:(CGPoint)point vector:(CGVector)vector
                  rect:(CGRect)rect range:(NSRange)range offset:(UIOffset)offset
{
    NSLog(@"get size:%@",   NSStringFromCGSize(size));
    NSLog(@"get point:%@",  NSStringFromCGPoint(point));
    NSLog(@"get vector:%@", NSStringFromCGVector(vector));
    NSLog(@"get rect:%@",   NSStringFromCGRect(rect));
    NSLog(@"get range:%@",  NSStringFromRange(range));
    NSLog(@"get offset:%@", NSStringFromUIOffset(offset));


}


- (handleBlock)methodBlock:(handleBlock2)blockArgument
{
    BOOL resultOfBlock = blockArgument(NO,9999,@"Some error.");
    NSLog(@"handleBlock2 result = %d", resultOfBlock);
    
    handleBlock aBlock = ^(BOOL result,
                           NSInteger returnCode,
                           NSString *message)
    {
        NSLog(@"handle block is calling, %d-%ld-%@",
              result, returnCode, message);
    };
    return aBlock;
}

@end
