//
//  LFXModuleManager.h
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/13.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LFXBaseModule.h"


NS_ASSUME_NONNULL_BEGIN

@interface LFXModuleManager : NSObject

/******************************************************************************/
/**** Service - Register / Unregister / Find Module                        ****/
/******************************************************************************/
#pragma mark - Service - Register / Unregister / Find Module

- (void)registerModule:(Class)moduleClass withName:(NSString *)moduleName;

- (void)unregisterModuleByName:(NSString *)moduleName;

- (LFXBaseModule *)moduleForName:(NSString *)moduleName;



/******************************************************************************/
/**** Service - Module Cache                                               ****/
/******************************************************************************/
#pragma mark - Service - Module Cache

- (void)addModuleToCache:(LFXBaseModule *)aModule;

- (void)clearModuleCache;


/******************************************************************************/
/**** Default Lifecycle & Constructor                                      ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)defaultManager;

@end

NS_ASSUME_NONNULL_END
