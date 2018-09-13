//
//  LFXSuperRouter.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/11.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "LFXSuperResult.h"

@interface LFXSuperRouter : NSObject

+ (LFXSuperResult *)invokeModule:(NSString *)moduleName
                         service:(NSString *)serviceName
                       arguments:(NSArray *)arguments;

@end
