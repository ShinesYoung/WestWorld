//
//  LFXSuperResult.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * LFXSuperResult - a wrapper of method's return type.
 *  if a method‘s returnType is 'void', then return is nil.
 *  if a method‘s returnType is not 'void', the return is LFXSuperResult instance,
 *  and the particular return value will save in the LFXSuperResult instance.
 *  You can use LFXSuperResult's xxxValue properties method
 *  to access the particular return value.
 */

@interface LFXSuperResult : NSObject

@property (nonatomic, assign) char               charValue;
@property (nonatomic, assign) unsigned char      unsignedCharValue;
@property (nonatomic, assign) short              shortValue;
@property (nonatomic, assign) unsigned short     unsignedShortValue;
@property (nonatomic, assign) int                intValue;
@property (nonatomic, assign) unsigned int       unsignedIntValue;
@property (nonatomic, assign) long               longValue;
@property (nonatomic, assign) unsigned long      unsignedLongValue;
@property (nonatomic, assign) long long          longLongValue;
@property (nonatomic, assign) unsigned long long unsignedLongLongValue;
@property (nonatomic, assign) float              floatValue;
@property (nonatomic, assign) double             doubleValue;
@property (nonatomic, assign) BOOL               boolValue;
@property (nonatomic, assign) NSInteger          integerValue;
@property (nonatomic, assign) NSUInteger         unsignedIntegerValue;
@property (nonatomic, strong) id                 objectValue;


@end
