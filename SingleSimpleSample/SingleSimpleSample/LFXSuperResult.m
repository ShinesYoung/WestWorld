//
//  LFXReturnType.m
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import "LFXSuperResult.h"

@implementation LFXSuperResult

- (void)print
{
    NSLog(@"LFXSuperResult = %@ \n"
          "boolValue = %d \n"
          "charValue = %c \n"
          "unsignedCharValue = %c \n"
          "shortValue = %d \n"
          "unsignedShortValue = %d \n"
          "intValue = %d \n"
          "unsignedIntValue = %d \n"
          "longValue = %ld \n"
          "unsignedLongValue = %lu \n"
          "longLongValue = %lld \n"
          "unsignedLongLongValue = %llu \n"
          "floatValue = %f \n"
          "doubleValue = %e \n"
          "integerValue = %ld \n"
          "unsignedIntegerValue = %lu \n"
          "objectValue = %@ \n",
          self, self.boolValue,
          self.charValue, self.unsignedCharValue,
          self.integerValue, self.unsignedIntegerValue,
          self.integerValue, self.unsignedIntegerValue,
          self.integerValue, self.unsignedIntegerValue,
          self.integerValue, self.unsignedIntegerValue,
          self.floatValue, self.doubleValue,
          self.integerValue, self.unsignedIntegerValue,
          self.objectValue);
}

@end
