//
//  WWUrlRouter.m
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/27.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWURLRouter.h"

@interface WWURLRouter ()

@property (nonatomic, strong) NSMutableDictionary *urlPatternTable;


@end


@implementation WWURLRouter

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
                      action:actionName argPattern:nil];
}

- (void)registerUrlPattern:(NSString *)urlPattern
                 forModule:(NSString *)moduleName
                    action:(NSString *)actionName
                argPattern:(NSString *)argPattern
{
    WWUrlPatternItem *aUrlPatternItem = [[WWUrlPatternItem alloc] init];
    aUrlPatternItem.urlPattern = urlPattern;
    aUrlPatternItem.moduleName = moduleName;
    aUrlPatternItem.actionName = actionName;
    aUrlPatternItem.argPattern = argPattern;
    
    [self registerURLPattern:aUrlPatternItem];
}

- (void)registerURLPattern:(WWUrlPatternItem *)urlPatternItem
{
    if (self.urlPatternTable) {
        [self.urlPatternTable setObject:urlPatternItem
                                 forKey:urlPatternItem.urlPattern];
    }
}



/******************************************************************************/
/**** Private - Match URL Pattern                                          ****/
/******************************************************************************/
#pragma mark - Service - Match URL Pattern

- (WWUrlPatternItem *)matchPatternWithURLString:(NSString *)aURLString
{
    return nil;
}


/******************************************************************************/
/**** Service - URL Handle Method                                          ****/
/******************************************************************************/
#pragma mark - Service - URL Handle Method

- (BOOL)canOpenURL:(NSURL *)aURL
{
    return NO;
}

- (BOOL)canOpenURLString:(NSString *)aURLString
{
    return NO;
}

- (void)openURLString:(NSString *)aURLString
{
    [self openURLString:aURLString userInfo:nil];
}

- (void)openURLString:(NSString *)aURLString userInfo:(NSDictionary *)userInfo
{
    [self openURLString:aURLString userInfo:userInfo completion:nil];
}

- (void)openURLString:(NSString *)aURLString userInfo:(NSDictionary *)userInfo
           completion:(void (^)(void))completion
{
    if ([self canOpenURLString:aURLString]) {
        [self matchPatternWithURLString:aURLString];
    }
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
    
    NSString *absoluteURLStirng = aURL.absoluteString;
    [self matchURLPattern];
    
}




/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance
{
    static WWURLRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[WWURLRouter class] alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.urlPatternTable = [NSMutableDictionary dictionary];
    }
    return self;
}

@end
