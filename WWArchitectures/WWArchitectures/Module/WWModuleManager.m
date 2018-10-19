//
//  WWModuleManager.m
//  WWArchitectures
//
//  Created by Shines Young on 2018/9/13.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWModuleManager.h"



@interface WWModuleManager ()

// 该字典用于保存APP中已经注册的Module名称和其对应Class。
@property (nonatomic, readonly, strong) NSMutableDictionary<NSString *, Class> *moduleRegisterDict;

// 该字典用于保存APP中已经被实例化的Module对象。
@property (nonatomic, readonly, strong) NSMutableDictionary<NSString *, id<WWModule>> *moduleCacheDict;

@property (nonatomic, readonly, strong) NSMutableArray<id<WWAppLifecycleListener>> *lifecycleModules;
@property (nonatomic, readonly, strong) NSMutableArray<id<WWAppOpenUrlListener>> *openUrlModules;

@end


@implementation WWModuleManager


/******************************************************************************/
/**** Service - Register / Unregister / Find Module                        ****/
/******************************************************************************/
#pragma mark - Service - Register / Unregister / Find Module

- (void)registerModule:(Class)moduleClass withName:(NSString *)moduleName
{
    if (self.moduleRegisterDict) {
        [self.moduleRegisterDict setObject:moduleClass forKey:moduleName];
    }
}

- (void)unregisterModuleByName:(NSString *)moduleName
{
    if ([self.moduleRegisterDict objectForKey:moduleName]) {
        [self.moduleRegisterDict removeObjectForKey:moduleName];
    }
}

- (id<WWModule>)moduleForName:(NSString *)moduleName
{
    // 1. find Module instance from cache.
    id<WWModule> aModule = nil;
    if (self.moduleCacheDict) {
        aModule = [self.moduleCacheDict objectForKey:moduleName];
    }
    if (aModule) { // found
        return aModule;
    }
    
    // 2. find Module Class from registerList;
    Class moduleClass = [self.moduleRegisterDict objectForKey:moduleName];
    if (moduleClass == nil || [moduleName isKindOfClass:[NSNull class]]) { // unfound
        return nil;
    }
    
     // found and instanced the Module Object, and add the Module to cache.
    SEL instanceSEL = NSSelectorFromString(@"instance");
    SEL sharedSEL = NSSelectorFromString(@"sharedInstance");
    if ([moduleClass respondsToSelector:instanceSEL])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        aModule = [moduleClass performSelector:instanceSEL];
#pragma clang diagnostic pop
    }
    else if ([moduleClass respondsToSelector:sharedSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        aModule = [moduleClass performSelector:sharedSEL];
#pragma clang diagnostic pop
    }
    else {
        aModule = [[moduleClass alloc] init];
    }
    [self addModuleToCache:aModule];

    return aModule;
}

- (NSArray<id<WWAppLifecycleListener>> *)modulesForAppLifecycle
{
    return self.lifecycleModules;
}

- (NSArray<id<WWAppOpenUrlListener>> *)modulesForAppOpenUrl
{
    return self.openUrlModules;
}



/******************************************************************************/
/**** Service - Module Cache                                               ****/
/******************************************************************************/
#pragma mark - Service - Module Cache

- (void)addModuleToCache:(id<WWModule>)aModule
{
    if (aModule == nil || [aModule isKindOfClass:[NSNull class]]) {
        return;
    }
    if (self.moduleCacheDict) {
        [self.moduleCacheDict setObject:aModule forKey:aModule.moduleName];
    }
    if ([aModule conformsToProtocol:@protocol(WWAppLifecycleListener)]) {
        [self.lifecycleModules addObject:(id<WWAppLifecycleListener>)aModule];
    }
    if ([aModule conformsToProtocol:@protocol(WWAppOpenUrlListener)]) {
        [self.openUrlModules addObject:(id<WWAppOpenUrlListener>)aModule];
    }
}

- (void)clearModuleCache
{
    if (self.moduleCacheDict) {
        [self.moduleCacheDict removeAllObjects];
    }
    if (self.lifecycleModules.count > 0) {
        [self.lifecycleModules removeAllObjects];
    }
    if (self.openUrlModules.count > 0) {
        [self.openUrlModules removeAllObjects];
    }
}


/******************************************************************************/
/**** Helper - Read Config File                                            ****/
/******************************************************************************/
#pragma mark - Helper - Read Config File

- (void)registerModulesFromConfigFile
{
    NSString *cfgFilePath
    = [[NSBundle mainBundle] pathForResource:@"lfx_module_config" ofType:@"plist"];
    
    if (cfgFilePath == nil) {
        NSLog(@"[WARNING] Module config file not found !!!");
        return;
    }
    
    NSDictionary *moduleCfgDict
    = [NSDictionary dictionaryWithContentsOfFile:cfgFilePath];
    
    
    NSArray *allKeys = moduleCfgDict.allKeys;
    for (NSString *aModuleName in allKeys)
    {
        NSString *aModuleClassName = [moduleCfgDict objectForKey:aModuleName];
        Class aModuleClass = NSClassFromString(aModuleClassName);
        [self registerModule:aModuleClass withName:aModuleName];
    }
    
    
}


/******************************************************************************/
/**** Default Lifecycle & Constructor                                      ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle & Constructor

+ (instancetype)defaultManager
{
    static WWModuleManager *theInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theInstance = [[WWModuleManager alloc] init];
    });
    return theInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->_moduleRegisterDict = [NSMutableDictionary dictionary];
        self->_moduleCacheDict = [NSMutableDictionary dictionary];
        self->_lifecycleModules = [NSMutableArray array];
        self->_openUrlModules = [NSMutableArray array];
        
        [self registerModulesFromConfigFile];
    }
    return self;
}

@end


