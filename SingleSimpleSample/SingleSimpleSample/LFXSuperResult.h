//
//  LFXSuperResult.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * LFXSuperResult - a wrapper of method's return type.
 *  if a method‘s returnType is 'void', then return is nil.
 *  if a method‘s returnType is not 'void', the return is LFXSuperResult instance,
 *  and the particular return value will save in the LFXSuperResult instance.
 *  You can use LFXSuperResult's xxxValue properties method
 *  to access the particular return value.
 */

@interface LFXSuperResult : NSObject

@property (nonatomic, strong) id                 objectValue;

@property (nonatomic, assign) BOOL               boolValue;
@property (nonatomic, assign) char               charValue;
@property (nonatomic, assign) unsigned char      unsignedCharValue;

@property (nonatomic, assign) long long          integerValue;
@property (nonatomic, assign) unsigned long long unsignedIntegerValue;

@property (nonatomic, assign) float              floatValue;
@property (nonatomic, assign) double             doubleValue;

@property (nonatomic, assign) CGPoint            cgPointValue;
@property (nonatomic, assign) CGSize             cgSizeValue;
@property (nonatomic, assign) CGVector           cgVectorValue;
@property (nonatomic, assign) CGRect             cgRectValue;
@property (nonatomic, assign) NSRange            rangeValue;
@property (nonatomic, assign) UIOffset           offsetValue;

- (void)print;

@end
