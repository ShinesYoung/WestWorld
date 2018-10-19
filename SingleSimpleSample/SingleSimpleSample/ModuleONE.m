//
//  ModuleONE.m
//  SingleSimpleSample
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "ModuleONE.h"

@implementation ModuleONE

- (NSString *)moduleName
{
    return @"ModuleONE";
}

- (NSString *)method1WithCGSize:(CGSize)size
                     withOption:(NSStringDrawingOptions)option
                 withAttributes:(NSDictionary *)attributes
{
    NSLog(@"get param %@ %ld %@", NSStringFromCGSize(size), option, attributes);
    
    NSString *aString = @"UILabel  ios7 与ios7之前实现自适应撑高的方法,"
    "文本的内容长度不一，我们需要根据内容的多少来自动换行处理。在IOS7下要求font，"
    "与breakmode与之前设置的完全一致sizeWithFont:font constrainedToSize:size"
    " lineBreakMode:NSLineBreakByCharWrappingUILabel  "
    "ios7 与ios7之前实现自适应撑高的方法,文本的内容长度不一，我们需要根据内容的多少来自动换行处理。"
    "在IOS7下要求font，与breakmode与之前设置的完全一致sizeWithFont:font "
    "constrainedToSize:size lineBreakMode:NSLineBreakByCharWrappingUILabel  "
    "ios7 与ios7之前实现自适应撑高的方法,文本的内容长度不一，我们需要根据内容的多少来自动换行处理。"
    "在IOS7下要求font，与breakmode与之前设置的完全一致sizeWithFont:font "
    "constrainedToSize:size lineBreakMode:NSLineBreakByCharWrappingUILabel  "
    "ios7 与ios7之前实现自适应撑高的方法,文本的内容长度不一，我们需要根据内容的多少来自动换行处理。"
    "在IOS7下要求font，与breakmode与之前设置的完全一致sizeWithFont:font "
    "constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping";
    
    CGRect stringFrm =
    [aString boundingRectWithSize:size
                          options:option
                       attributes:attributes
                          context:nil];
    
    NSString *result = NSStringFromCGRect(stringFrm);
    return result;
}

- (void)welcome
{
    NSLog(@"Welcome to Module One.");
}

@end
