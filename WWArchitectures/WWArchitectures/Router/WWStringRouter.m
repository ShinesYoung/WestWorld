//
//  WWSuperRouter.h
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWStringRouter.h"

#import "WWModuleManager.h"
#import "WWSuperInvoker.h"


@implementation WWStringRouter

/******************************************************************************/
/**** Helper - Show Alert Tips                                             ****/
/******************************************************************************/
#pragma mark - Helper - Show Alert Tips

+ (void)showAlertWithError:(NSString *)reason
{
    UIAlertController *alert
    = [UIAlertController alertControllerWithTitle:@"Router Error"
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


+ (WWSuperResult *)invokeModule:(NSString *)moduleName
                         action:(NSString *)actionName
                      arguments:(NSArray *)arguments
{
    WWModuleManager *moduleMgr = [WWModuleManager defaultManager];
    
    id<WWModule> aModule = [moduleMgr moduleForName:moduleName];
    if (aModule == nil)
    {
        NSString *reason
        = [NSString stringWithFormat:@"Module Not Found : '%@'", moduleName];
        [self showAlertWithError:reason];
        return nil;
    }
    
    
    SEL aAction = NSSelectorFromString(actionName);
    
    if ([aModule respondsToSelector:aAction] == NO)
    {
        NSString *reason
        = [NSString stringWithFormat:@"Module Unknown selector : -[%@ %@]",
           NSStringFromClass([aModule class]), NSStringFromSelector(aAction)];
        [self showAlertWithError:reason];
        return nil;
    }
    
    WWSuperInvoker *invoker = [WWSuperInvoker instance];
    WWSuperResult *result = [invoker callInvocationOfInstance:aModule
                                                        method:aAction
                                                     arguments:arguments];
    
    return result;
}





/******************************************************************************/
/**** Constructor & Lifecycle Method                                       ****/
/******************************************************************************/
#pragma mark - Constructor & Lifecycle Method

+ (instancetype)sharedInstance
{
    static WWStringRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[WWStringRouter class] alloc] init];
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
