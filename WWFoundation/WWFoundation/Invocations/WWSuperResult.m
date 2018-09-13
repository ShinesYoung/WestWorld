//
//  WWSuperResult.m
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWSuperResult.h"

@implementation WWSuperResult

- (void)print
{
    NSLog(@"LFXSuperResult = %@ \n"
          "boolValue = %d \n"
          "charValue = %c \nunsignedCharValue = %c \n"
          "integerValue = %lld \nunsignedIntegerValue = %llu \n"
          "floatValue = %f \ndoubleValue = %e \n"
          "objectValue = %@ \n",
          self, self.boolValue,
          self.charValue, self.unsignedCharValue,
          self.integerValue, self.unsignedIntegerValue,
          self.floatValue, self.doubleValue,
          self.objectValue);
}

@end
