//
//  WWApplicationLifecycleListener.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/20.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WWAppLifecycleListener <NSObject>

@optional

- (void)applicationDidFinishLaunching:(UIApplication *)application;

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;

- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;

- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;

// try to clean up as much memory as possible. next step is to terminate app
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application;

@end
