//
//  WWModule.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WWSuperResult.h"

@interface WWSuperRouter : NSObject

+ (WWSuperResult *)invokeModule:(NSString *)moduleName
                         service:(NSString *)serviceName
                       arguments:(NSArray *)arguments;

@end
