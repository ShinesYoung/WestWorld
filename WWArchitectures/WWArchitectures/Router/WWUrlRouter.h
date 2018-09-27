//
//  WWUrlRouter.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/27.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface WWUrlRouter : NSObject

/******************************************************************************/
/**** Service - Register Url Pattern                                       ****/
/******************************************************************************/
#pragma mark - Service - Register Url Pattern

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                   service:(NSString *)serviceName;

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                   service:(NSString *)serviceName
               argsPattern:(NSString *_Nullable)argsPattern;



/******************************************************************************/
/**** Service - URL Handle Method                                          ****/
/******************************************************************************/
#pragma mark - Service - URL Handle Method

- (BOOL)canOpenURL:(NSURL *)aURL;
- (BOOL)canOpenUrlString:(NSString *)aUrlString;

- (void)openURL:(NSURL *)aURL;
- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *)userInfo;
- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *)userInfo
     completion:(void(^)(void))completion;

- (void)openUrlString:(NSString *)aUrlString;
- (void)openUrlString:(NSString *)aUrlString userInfo:(NSDictionary *)userInfo;
- (void)openUrlString:(NSString *)aUrlString userInfo:(NSDictionary *)userInfo
           completion:(void(^)(void))completion;



/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
