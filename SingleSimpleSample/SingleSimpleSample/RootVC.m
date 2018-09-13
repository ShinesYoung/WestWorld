//
//  RootVC.m
//  SingleSimpleSample
//
//  Created by Shines Young on 2018/9/10.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "RootVC.h"

#import <JavaScriptCore/JavaScriptCore.h>
#import "SomeObject.h"
#import "LFXSuperInvoker.h"
#import "LFXSuperResult.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SomeObject *someObj = [[SomeObject alloc] init];
    
    LFXSuperInvoker *invoker = [LFXSuperInvoker instance];
    LFXSuperResult *result = nil;
    
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodBool)
//                                     arguments:nil];
//    NSLog(@"methodBool return : %d", result.boolValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodChar)
//                                     arguments:nil];
//    NSLog(@"methodChar return : %c", result.charValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedChar)
//                              arguments:nil];
//    NSLog(@"methodUnsignedChar return : %c", result.unsignedCharValue);
//
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodShort)
//                                     arguments:nil];
//    NSLog(@"methodShort return : %d", result.shortValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedShort)
//                                     arguments:nil];
//    NSLog(@"methodUnsignedShort return : %d", result.unsignedShortValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodInt)
//                                     arguments:nil];
//    NSLog(@"methodInt return : %d", result.intValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedInt)
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInt return : %u", result.unsignedIntValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodLong)
//                                     arguments:nil];
//    NSLog(@"methodLong return : %ld", result.longValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedLong)
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLong return : %lu", result.unsignedLongValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodLongLong)
//                                     arguments:nil];
//    NSLog(@"methodLongLong return : %lld", result.longLongValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedLongLong)
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLongLong return : %llu", result.unsignedLongLongValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodFloat)
//                                     arguments:nil];
//    NSLog(@"methodFloat return : %f", result.floatValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodDouble)
//                                     arguments:nil];
//    NSLog(@"methodDouble return : %e", result.doubleValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodInteger)
//                                     arguments:nil];
//    NSLog(@"methodInteger return : %ld", result.integerValue);
//
//    result = [invoker callInvocationOfInstance:someObj
//                                        method:@selector(methodUnsignedInteger)
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInteger return : %lu", result.unsignedIntegerValue);
    
    NSArray *arguments
    = @[@"This is a String", @(999999.999999), @[@"str1", @"str2", @"str3"],
        @{@"k1":@"v1", @"k2":@"v2"}, @(YES), @('X'), @('W'), @(-555), @555,
        @(-1234567890), @(1234567890), @(-1234567890), @(1234567890),
        @(12345.6789f), @(123456789.0), [NSNull null] ];
    
    SEL method = @selector(methodVoidWithString:number:array:dictionary:withBool:withChar:withUChar:withInt:withUInt:withLong:withULong:withInteger:withUInteger:withFloat:withDouble:withObject:);
    
    result = [invoker callInvocationOfInstance:someObj
                                        method:method
                                     arguments:arguments];
    NSLog(@"methodUnsignedInteger return : %@", result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
