//
//  WWModuleManager.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WWBaseModule.h"
#import "WWModule.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWModuleManager : NSObject

/******************************************************************************/
/**** Service - Register / Unregister / Find Module                        ****/
/******************************************************************************/
#pragma mark - Service - Register / Unregister / Find Module

- (void)registerModule:(Class)moduleClass withName:(NSString *)moduleName;

- (void)unregisterModuleByName:(NSString *)moduleName;

- (id<WWModule>)moduleForName:(NSString *)moduleName;



/******************************************************************************/
/**** Service - Module Cache                                               ****/
/******************************************************************************/
#pragma mark - Service - Module Cache

- (void)addModuleToCache:(id<WWModule>)aModule;

- (void)clearModuleCache;


/******************************************************************************/
/**** Default Lifecycle & Constructor                                      ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)defaultManager;

@end

NS_ASSUME_NONNULL_END
