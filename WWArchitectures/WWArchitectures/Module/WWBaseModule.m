//
//  WWBaseModule.m
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWBaseModule.h"

@implementation WWBaseModule

- (NSString *)moduleName
{
    NSString *reaseon = [NSString stringWithFormat:@"Sub class unimplemented "
                         "the class method -[%@ moduleName].",
                         NSStringFromClass([self class])];
    @throw [NSException exceptionWithName:@"WW Module Implement Error"
                                   reason:reaseon
                                 userInfo:nil];
    return @"LFXBaseModule";
}





@end
