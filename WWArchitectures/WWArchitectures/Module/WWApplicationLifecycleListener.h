//
//  WWApplicationLifecycleListener.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/20.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WWApplicationLifecycleListener <NSObject>

@optional

- (void)applicationDidFinishLaunching:(UIApplication *)application;
#if UIKIT_STRING_ENUMS
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions NS_AVAILABLE_IOS(6_0);
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions NS_AVAILABLE_IOS(3_0);
#else
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0);
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0);
#endif

- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillResignActive:(UIApplication *)application;
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url NS_DEPRECATED_IOS(2_0, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation NS_DEPRECATED_IOS(4_2, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED;

@end
