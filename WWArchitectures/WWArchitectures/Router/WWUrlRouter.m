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
/**** Service - Register Url Pattern                                       ****/
/******************************************************************************/
#pragma mark - Service - Register Url Pattern

- (void)registerUrlPattern:(NSString *)urlPattern forModule:(NSString *)moduleName service:(NSString *)serviceName
{
    [self registerUrlPattern:urlPattern forModule:moduleName service:serviceName argsPattern:nil];
}

- (void)registerUrlPattern:(NSString *)urlPattern forModule:(NSString *)moduleName
                   service:(NSString *)serviceName argsPattern:(NSString *)argsPattern
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
