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
#import "WWSuperInvoker.h"

#import "WWBaseModule.h"
#import "WWSuperRouter.h"
#import "WWConcurrentManager.h"

@interface RootVC ()

@end

@implementation RootVC

- (IBAction)onBtnClicked:(id)sender
{
    
    WWSuperResult *result = nil;
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodBool" arguments:nil];
//    NSLog(@"methodBool return : %d", result.boolValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodChar"
//                                arguments:nil];
//    NSLog(@"methodChar return : %c", result.charValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedChar"
//                              arguments:nil];
//    NSLog(@"methodUnsignedChar return : %c", result.unsignedCharValue);
//
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodShort"
//                                     arguments:nil];
//    NSLog(@"methodShort return : %d", result.integerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedShort"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedShort return : %d", result.unsignedIntegerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodInt"
//                                     arguments:nil];
//    NSLog(@"methodInt return : %d", result.integerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedInt"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInt return : %u", result.unsignedIntegerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodLong"
//                                     arguments:nil];
//    NSLog(@"methodLong return : %ld", result.integerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedLong"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLong return : %lu", result.unsignedIntegerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodLongLong"
//                                     arguments:nil];
//    NSLog(@"methodLongLong return : %lld", result.integerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedLongLong"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLongLong return : %llu", result.unsignedIntegerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodFloat"
//                                     arguments:nil];
//    NSLog(@"methodFloat return : %f", result.floatValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodDouble"
//                                     arguments:nil];
//    NSLog(@"methodDouble return : %e", result.doubleValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodInteger"
//                                     arguments:nil];
//    NSLog(@"methodInteger return : %lld", result.integerValue);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedInteger"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInteger return : %llu", result.unsignedIntegerValue);
//
//    NSArray *arguments
//    = @[@"This is a String", @(999999.999999), @[@"str1", @"str2", @"str3"],
//        @{@"k1":@"v1", @"k2":@"v2"}, @(YES), @('X'), @('W'), @(-555), @555,
//        @(-1234567890), @(1234567890), @(-1234567890), @(1234567890),
//        @(12345.6789f), @(123456789.0), [NSNull null] ];
//
//    SEL method = @selector(methodVoidWithString:number:array:dictionary:withBool:withChar:withUChar:withInt:withUInt:withLong:withULong:withInteger:withUInteger:withFloat:withDouble:withObject:);
//    NSString *serviceName = NSStringFromSelector(method);
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:serviceName
//                                     arguments:arguments];
//    NSLog(@"multiple argument method return : %@", result);
//    [result print];
//
//
//    NSLog(@"method1 return : %@", result.objectValue);
//    [result print];
//
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodPoint"
//                                arguments:nil];
//    CGPoint aPoint = result.cgPointValue;
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodSize"
//                                arguments:nil];
//    CGSize aSize = result.cgSizeValue;
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodVector"
//                                arguments:nil];
//    CGVector aVector = result.cgVectorValue;
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodRect"
//                                arguments:nil];
//    CGRect aRect = result.cgRectValue;
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodRange"
//                                arguments:nil];
//    NSRange aRange = result.rangeValue;
//
//    result = [WWSuperRouter invokeModule:@"SomeObject"
//                                  service:@"methodOffset"
//                                arguments:nil];
//    UIOffset aOffset = result.offsetValue;
//
//
//    NSArray *argus = @[[NSValue valueWithCGSize:aSize],
//                       [NSValue valueWithCGPoint:aPoint],
//                       [NSValue valueWithCGVector:aVector],
//                       [NSValue valueWithCGRect:aRect],
//                       [NSValue valueWithRange:aRange],
//                       [NSValue valueWithUIOffset:aOffset]];
//    [WWSuperRouter invokeModule:@"SomeObject"
//                         service:@"methodWithSize:point:vector:rect:range:offset:"
//                       arguments:argus];
//
//    handleBlock2 blockArg = ^BOOL(BOOL result,
//                                      NSInteger returnCode,
//                                      NSString *message)
//    {
//        NSLog(@"handleBlock2 called %d-%ld-%@", result, returnCode, message);
//        return YES;
//    };
//
//    NSArray *arguments2 = @[blockArg];
//
//    result = [WWSuperRouter invokeModule:@"SomeObject" service:@"methodBlock:"
//                               arguments:arguments2];
//
//    handleBlock aBlock = (handleBlock) result.objectValue;
//    if (aBlock) {
//        aBlock (YES,0,@"OK");
//    }
    
    
    id<WWDispatchQueue> aQueue = WWConcurrentManager.defaultGlobalQueue;
    
    for (NSUInteger index = 0; index<100; index++)
    {
        [aQueue async:^{
            
            NSLog(@"Current Thread %@ IN", aQueue.queueName);
            for (NSUInteger i=0 ; i<99999999; i++) {}
            NSLog(@"Current thread %@ OUT",  aQueue.queueName);

        }];

    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *aBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    aBtn.frame = CGRectMake(100, 100, 100, 40);
    [aBtn setTitle:@"Click" forState:(UIControlStateNormal)];
    [aBtn setBackgroundColor:[UIColor blueColor]];
    [aBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [aBtn addTarget:self action:@selector(onBtnClicked:)
   forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:aBtn];
}


- (void)viewDidAppear:(BOOL)animated
{
//    WWSuperResult *result =
//    [WWSuperRouter invokeModule:@"ModuleONE" service:@"welcome" arguments:nil];
//    
//    NSLog(@"router return = %@", result);
    
    const char *objcType = @encode(handleBlock3);
    NSLog(@"objcType = %s", objcType);
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
