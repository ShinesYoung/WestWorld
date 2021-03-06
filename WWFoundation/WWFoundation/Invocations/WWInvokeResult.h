//
//  WWInvokeResult.h
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * WWInvokeResult - a wrapper of method's return type.
 *  if a method‘s returnType is 'void', then return is nil.
 *  if a method‘s returnType is not 'void', the return is WWSuperResult instance,
 *  and the particular return value will save in the WWSuperResult instance.
 *  You can use WWInvokeResult's xxxValue properties method
 *  to access the particular return value.
 */

@interface WWInvokeResult : NSObject

@property (nonatomic, strong, readonly) NSValue    *value;
@property (nonatomic, assign, readonly) const char *objCType;
@property (nonatomic, assign, readonly) NSUInteger length;

- (id)                objectValue;
- (BOOL)              boolValue;
- (char)              charValue;
- (unsigned char)     unsignedCharValue;
- (short)             shortValue;
- (unsigned short)    unsignedShortValue;
- (int)               intValue;
- (unsigned int)      unsignedIntValue;
- (long)              longValue;
- (unsigned long)     unsignedLongValue;
- (long long)         longLongValue;
- (unsigned long long)unsignedLongLongValue;
- (NSInteger)         integerValue;
- (NSUInteger)        unsignedIntegerValue;
- (float)             floatValue;
- (double)            doubleValue;

- (CGPoint)           CGPointValue;
- (CGSize)            CGSizeValue;
- (CGVector)          CGVectorValue;
- (CGRect)            CGRectValue;
- (NSRange)           rangeValue;
- (UIOffset)          UIOffsetValue;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithValue:(NSValue *)aValue
                     objCType:(const char*)objCType
                       length:(NSUInteger)length;
- (void)print;

@end
