//
//  NSString+Utils.m
//  WWFoundation
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (BOOL)isNilOrEmpty
{
    if (self == nil || [self isKindOfClass:[NSNull class]] || self.length == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)trimOfWhitespace
{
    NSCharacterSet *charsetOfWhitespace = [NSCharacterSet whitespaceCharacterSet];
    return [self stringByTrimmingCharactersInSet:charsetOfWhitespace];
}

- (NSString *)trimOfNewLine
{
    NSCharacterSet *charsetOfNewLine = [NSCharacterSet newlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:charsetOfNewLine];
}

@end
