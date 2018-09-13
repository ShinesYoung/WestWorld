//
//  ModuleONE.h
//  SingleSimpleSample
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WWBaseModule.h"

@interface ModuleONE : WWBaseModule

- (NSString *)method1WithCGSize:(CGSize)size
                     withOption:(NSStringDrawingOptions)option
                 withAttributes:(NSDictionary *)attributes;

- (void)welcome;

@end
