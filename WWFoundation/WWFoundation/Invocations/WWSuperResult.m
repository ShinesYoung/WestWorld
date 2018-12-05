//
//  WWSuperResult.m
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWSuperResult.h"

@implementation WWSuperResult

- (id)objectValue
{
    id aObject = nil;
    if (strcmp(self.objCType, @encode(id)) == 0 ||
        strcmp(self.objCType, "@?") == 0)
    {
        [self.value getValue:&aObject];
    }
    return aObject;
}

- (BOOL)boolValue
{
    BOOL aBool = NO;
    if (strcmp(self.objCType, @encode(BOOL)) == 0) {
        [self.value getValue:&aBool];
    }
    return aBool;
}

- (char)charValue
{
    char aChar = 0;
    [self.value getValue:&aChar];
    return aChar;
}

- (unsigned char)unsignedCharValue
{
    unsigned char aUChar = 0;
    [self.value getValue:&aUChar];
    return aUChar;
}

- (short)shortValue
{
    unsigned int aShort = 0;
    [self.value getValue:&aShort];
    return aShort;
}

- (unsigned short)unsignedShortValue
{
    unsigned int aUShort = 0;
    [self.value getValue:&aUShort];
    return aUShort;
}

- (int)intValue
{
    unsigned int aInt = 0;
    [self.value getValue:&aInt];
    return aInt;
}

- (unsigned int)unsignedIntValue
{
    unsigned int aUInt = 0;
    [self.value getValue:&aUInt];
    return aUInt;
}

- (long)longValue
{
    long aLong = 0;
    [self.value getValue:&aLong];
    return aLong;
}

- (unsigned long)unsignedLongValue
{
    unsigned long aULong = 0;
    [self.value getValue:&aULong];
    return aULong;
}

- (long long)longLongValue
{
    long long aLongLong = 0;
    [self.value getValue:&aLongLong];
    return aLongLong;
}

- (unsigned long long)unsignedLongLongValue
{
    unsigned long long aULongLong = 0;
    [self.value getValue:&aULongLong];
    return aULongLong;
}

- (NSInteger)integerValue
{
    NSInteger aInteger = 0;
    [self.value getValue:&aInteger];
    return aInteger;
}

- (NSUInteger)unsignedIntegerValue
{
    NSUInteger aUInteger = 0;
    [self.value getValue:&aUInteger];
    return aUInteger;
}

- (float)floatValue
{
    float aFloat = 0.0f;
    [self.value getValue:&aFloat];
    return aFloat;
}

- (double)doubleValue
{
    double aDouble = 0.0;
    [self.value getValue:&aDouble];
    return aDouble;
}

- (CGPoint)CGPointValue
{
    return [self.value CGPointValue];
}

- (CGSize)CGSizeValue
{
    return [self.value CGSizeValue];
}

- (CGRect)CGRectValue
{
    return [self.value CGRectValue];
}

- (CGVector)CGVectorValue
{
    return [self.value CGVectorValue];
}

- (NSRange)rangeValue
{
    return [self.value rangeValue];
}

- (UIOffset)UIOffsetValue
{
    return [self.value UIOffsetValue];
}



/******************************************************************************/
/**** System - Default Lifecycle & Constructor                             ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

- (instancetype)initWithValue:(NSValue *)aValue objCType:(const char *)objCType
                       length:(NSUInteger)length
{
    self = [super init];
    if (self) {
        self->_value = aValue;
        self->_objCType = objCType;
        self->_length = length;
    }
    return self;
}


- (void)print
{
    NSLog(@"LFXSuperResult = %@ \n"
          "boolValue = %d \n"
          "charValue = %c \nunsignedCharValue = %c \n"
          "integerValue = %ld \nunsignedIntegerValue = %lu \n"
          "floatValue = %f \ndoubleValue = %e \n"
          "objectValue = %@ \n",
          self, self.boolValue,
          self.charValue, self.unsignedCharValue,
          self.integerValue, self.unsignedIntegerValue,
          self.floatValue, self.doubleValue,
          self.objectValue);
}

@end
