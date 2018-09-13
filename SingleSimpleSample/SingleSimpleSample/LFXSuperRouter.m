//
//  LFXSuperRouter.m
//  LeGaoCommon
//
//  Created by 杨善嗣 on 2018/9/11.
//  Copyright © 2018年 王卫. All rights reserved.
//

#import "LFXSuperRouter.h"

#import "LFXModuleManager.h"
#import "LFXSuperInvoker.h"


@implementation LFXSuperRouter

+ (LFXSuperResult *)invokeModule:(NSString *)moduleName
                         service:(NSString *)serviceName
                       arguments:(NSArray *)arguments
{
    LFXModuleManager *moduleMgr = [LFXModuleManager defaultManager];
    
    LFXBaseModule *aModule = [moduleMgr moduleForName:moduleName];
    if (aModule == nil)
    {
        NSString *reason
        = [NSString stringWithFormat:@"Module Not Found : '%@'", moduleName];
        [self showAlertWithError:reason];
        return nil;
    }
    
    
    SEL aAction = NSSelectorFromString(serviceName);
    
    if ([aModule respondsToSelector:aAction] == NO)
    {
        NSString *reason
        = [NSString stringWithFormat:@"Module Unknown selector : -[%@ %@]",
           NSStringFromClass([aModule class]), NSStringFromSelector(aAction)];
        [self showAlertWithError:reason];
        return nil;
    }
    
    LFXSuperInvoker *invoker = [LFXSuperInvoker instance];
    LFXSuperResult *result = [invoker callInvocationOfInstance:aModule
                                                        method:aAction
                                                     arguments:arguments];
    
    return result;
}

/******************************************************************************/
/**** Default Lifecycle                                                    ****/
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

@end
