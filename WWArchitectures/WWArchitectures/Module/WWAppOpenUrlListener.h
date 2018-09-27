//
//  WWAppOpenUrlListener.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/25.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WWAppOpenUrlListener <NSObject>

@optional

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
@end
