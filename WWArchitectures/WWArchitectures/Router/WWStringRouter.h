//
//  WWStringRouter.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WWSuperResult.h"


NS_ASSUME_NONNULL_BEGIN

@interface WWStringRouter : NSObject

/******************************************************************************/
/**** Service - Routing Service Method                                     ****/
/******************************************************************************/
#pragma mark - Service - Routing Service Method

- (WWSuperResult *)routingToModule:(NSString *)moduleName
                            action:(NSString *)actionName
                           argDict:(NSDictionary *)argDict
                          argOrder:(NSArray *)argOrder;

- (WWSuperResult *)routingToModule:(NSString *)moduleName
                            action:(NSString *)actionName;

- (WWSuperResult *)routingToModule:(NSString *)moduleName
                            action:(NSString *)actionName
                         arguments:(NSArray *)arguments;


/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
