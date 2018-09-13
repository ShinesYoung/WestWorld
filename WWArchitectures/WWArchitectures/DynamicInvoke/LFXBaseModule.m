//
//  LFXBaseModule.m
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import "LFXBaseModule.h"

@implementation LFXBaseModule

- (NSString *)moduleName
{
    NSString *reaseon = [NSString stringWithFormat:@"Sub class unimplemented "
                         "the class method -[%@ moduleName].",
                         NSStringFromClass([self class])];
    @throw [NSException exceptionWithName:@"LFX Module Implement Error"
                                   reason:reaseon
                                 userInfo:nil];
    return @"LFXBaseModule";
}

+ (instancetype)instance
{
    static LFXBaseModule *theInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theInstance = [[[self class] alloc] init];
    });
    return theInstance;
}



@end
