//
//  WWAppDelegate.m
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWAppDelegate.h"
#import "WWModuleManager.h"
#import "WWUrlURLRouter.h"


@implementation WWAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(application:willFinishLaunchingWithOptions:)]) {
            [aListener application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.rootVC = [[UINavigationController alloc] init];
    self.window.rootViewController = self.rootVC;
    [self.window addSubview:self.rootVC.view];
    [self.window makeKeyAndVisible];
    
    
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [aListener application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(applicationWillResignActive:)]) {
            [aListener applicationWillResignActive:application];
        }
    }
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(applicationDidEnterBackground:)]) {
            [aListener applicationDidEnterBackground:application];
        }
        
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(applicationWillEnterForeground:)]) {
            [aListener applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(applicationDidBecomeActive:)]) {
            [aListener applicationDidBecomeActive:application];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    NSArray<id<WWAppLifecycleListener>> *appLifecycleListeners
    = [[WWModuleManager defaultManager] modulesForAppLifecycle];
    
    for (id<WWAppLifecycleListener> aListener in appLifecycleListeners)
    {
        if ([aListener respondsToSelector:@selector(applicationWillTerminate:)]) {
            [aListener applicationWillTerminate:application];
        }
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url
  sourceApplication:(nullable NSString *)sourceApplication
         annotation:(nonnull id)annotation
{
    NSArray<id<WWAppOpenUrlListener>> *appOpenUrlListeners
    = [[WWModuleManager defaultManager] modulesForAppOpenUrl];
    
    for (id<WWAppOpenUrlListener> aListener in appOpenUrlListeners)
    {
        if ([aListener respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]) {
            [aListener application:app openURL:url
                 sourceApplication:sourceApplication annotation:annotation];
        }
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    NSArray<id<WWAppOpenUrlListener>> *appOpenUrlListeners
    = [[WWModuleManager defaultManager] modulesForAppOpenUrl];
    
    for (id<WWAppOpenUrlListener> aListener in appOpenUrlListeners)
    {
        if ([aListener respondsToSelector:@selector(application:openURL:options:)]) {
            [aListener application:app openURL:url options:options];
        }
    }
    
    return YES;
}

@end
