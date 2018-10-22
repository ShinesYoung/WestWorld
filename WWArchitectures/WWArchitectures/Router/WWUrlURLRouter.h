//
//  WWUrlRouter.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/27.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface WWUrlURLRouter : NSObject

/******************************************************************************/
/**** Service - Register Url Pattern                                       ****/
/******************************************************************************/
#pragma mark - Service - Register Url Pattern

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                    action:(NSString *)actionName;

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                    action:(NSString *)actionName
               argsPattern:(NSString *_Nullable)argsPattern;


/******************************************************************************/
/**** Service - URL Handle Method                                          ****/
/******************************************************************************/
#pragma mark - Service - URL Handle Method

- (BOOL)canOpenURL:(NSURL *)aURL;
- (BOOL)canOpenURLString:(NSString *)aURLString;

- (void)openURLString:(NSString *)aURLString;
- (void)openURLString:(NSString *)aURLString userInfo:(NSDictionary *_Nullable)userInfo;
- (void)openURLString:(NSString *)aURLString userInfo:(NSDictionary *_Nullable)userInfo
           completion:(nullable void(^)(void))completion;

- (void)openURL:(NSURL *)aURL;
- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *_Nullable)userInfo;
- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *_Nullable)userInfo
     completion:(nullable void(^)(void))completion;


/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
