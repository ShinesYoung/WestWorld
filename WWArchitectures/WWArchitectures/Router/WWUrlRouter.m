//
//  WWUrlRouter.m
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/27.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWUrlRouter.h"

@implementation WWUrlRouter

/******************************************************************************/
/**** Private Utility -  Show Alert Tips                                   ****/
/******************************************************************************/
#pragma mark - Private Utility - Show Alert Tips

- (void)showAlertWithError:(NSString *)reason
{
    UIAlertController *alert
    = [UIAlertController alertControllerWithTitle:@"Routing Error"
                                          message:reason
                                   preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *confirm
    = [UIAlertAction actionWithTitle:@"确定"
                               style:(UIAlertActionStyleCancel)
                             handler:nil];
    [alert addAction:confirm];
    
    UIViewController *rootVC
    = [UIApplication sharedApplication].delegate.window.rootViewController;
    [rootVC presentViewController:alert animated:YES completion:nil];
}


/******************************************************************************/
/**** Service - Register Url Pattern                                       ****/
/******************************************************************************/
#pragma mark - Service - Register Url Pattern

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                    action:(NSString *)actionName
{
    [self registerUrlPattern:urlPattern forModule:moduleName
                      action:actionName argsPattern:nil];
}

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                   action:(NSString *)actionName
               argsPattern:(NSString *)argsPattern
{
    
}

/******************************************************************************/
/**** Service - URL Handle Method                                          ****/
/******************************************************************************/
#pragma mark - Service - URL Handle Method

- (BOOL)canOpenURL:(NSURL *)aURL
{
    return NO;
}

- (BOOL)canOpenUrlString:(NSString *)aUrlString
{
    return NO;
}

- (void)openUrlString:(NSString *)aUrlString
{
    [self openUrlString:aUrlString userInfo:nil];
}

- (void)openUrlString:(NSString *)aUrlString userInfo:(NSDictionary *)userInfo
{
    [self openUrlString:aUrlString userInfo:userInfo completion:nil];
}

- (void)openUrlString:(NSString *)aUrlString userInfo:(NSDictionary *)userInfo
           completion:(void (^)(void))completion
{
    
}

- (void)openURL:(NSURL *)aURL
{
    [self openURL:aURL userInfo:nil];
}

- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *)userInfo
{
    [self openURL:aURL userInfo:userInfo completion:nil];
}

- (void)openURL:(NSURL *)aURL userInfo:(NSDictionary *)userInfo
     completion:(void (^)(void))completion
{
    if (aURL == nil) {
        return;
    }
    
    
}




/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance
{
    static WWUrlRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[WWUrlRouter class] alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
