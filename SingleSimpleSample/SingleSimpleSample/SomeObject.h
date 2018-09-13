//
//  SomeObject.h
//  SingleSimpleSample
//
//  Created by 杨善嗣 on 2018/9/12.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WWBaseModule.h"


@interface SomeObject : WWBaseModule


- (id)methodObject;

- (BOOL)methodBool;
- (char)methodChar;
- (unsigned char)methodUnsignedChar;
- (short)methodShort;
- (unsigned short)methodUnsignedShort;
- (int)methodInt;
- (unsigned int)methodUnsignedInt;
- (long)methodLong;
- (unsigned long)methodUnsignedLong;
- (long long)methodLongLong;
- (unsigned long long)methodUnsignedLongLong;
- (float)methodFloat;
- (double)methodDouble;
- (NSInteger)methodInteger;
- (NSUInteger)methodUnsignedInteger;



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
                  withObject:(id)objP;

- (CGSize)methodSize;

- (CGPoint)methodPoint;

- (CGVector)methodVector;

- (CGRect)methodRect;

- (NSRange)methodRange;

- (UIOffset)methodOffset;

- (void)methodWithSize:(CGSize)size point:(CGPoint)point vector:(CGVector)vector
                  rect:(CGRect)rect range:(NSRange)range offset:(UIOffset)offset;


@end
