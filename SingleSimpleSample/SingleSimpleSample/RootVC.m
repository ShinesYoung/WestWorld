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

#import "LFXBaseModule.h"
#import "LFXSuperRouter.h"

@interface RootVC ()

@end

@implementation RootVC

- (IBAction)onBtnClicked:(id)sender
{
    
    LFXSuperResult *result =
    [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodBool" arguments:nil];
    NSLog(@"methodBool return : %d", result.boolValue);

//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodChar"
//                                arguments:nil];
//    NSLog(@"methodChar return : %c", result.charValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedChar"
//                              arguments:nil];
//    NSLog(@"methodUnsignedChar return : %c", result.unsignedCharValue);
//
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodShort"
//                                     arguments:nil];
//    NSLog(@"methodShort return : %d", result.shortValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedShort"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedShort return : %d", result.unsignedShortValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodInt"
//                                     arguments:nil];
//    NSLog(@"methodInt return : %d", result.intValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedInt"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInt return : %u", result.unsignedIntValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodLong"
//                                     arguments:nil];
//    NSLog(@"methodLong return : %ld", result.longValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedLong"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLong return : %lu", result.unsignedLongValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodLongLong"
//                                     arguments:nil];
//    NSLog(@"methodLongLong return : %lld", result.longLongValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedLongLong"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedLongLong return : %llu", result.unsignedLongLongValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodFloat"
//                                     arguments:nil];
//    NSLog(@"methodFloat return : %f", result.floatValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodDouble"
//                                     arguments:nil];
//    NSLog(@"methodDouble return : %e", result.doubleValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodInteger"
//                                     arguments:nil];
//    NSLog(@"methodInteger return : %ld", result.integerValue);
//
//    result = [LFXSuperRouter invokeModule:@"SomeObject" service:@"methodUnsignedInteger"
//                                     arguments:nil];
//    NSLog(@"methodUnsignedInteger return : %lu", result.unsignedIntegerValue);
//
    NSArray *arguments
    = @[@"This is a String", @(999999.999999), @[@"str1", @"str2", @"str3"],
        @{@"k1":@"v1", @"k2":@"v2"}, @(YES), @('X'), @('W'), @(-555), @555,
        @(-1234567890), @(1234567890), @(-1234567890), @(1234567890),
        @(12345.6789f), @(123456789.0), [NSNull null] ];

    SEL method = @selector(methodVoidWithString:number:array:dictionary:withBool:withChar:withUChar:withInt:withUInt:withLong:withULong:withInteger:withUInteger:withFloat:withDouble:withObject:);
    NSString *serviceName = NSStringFromSelector(method);

    result = [LFXSuperRouter invokeModule:@"SomeObject" service:serviceName
                                     arguments:arguments];
    NSLog(@"multiple argument method return : %@", result);
    [result print];


    NSLog(@"method1 return : %@", result.objectValue);
    [result print];
    
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodPoint"
                                arguments:nil];
    CGPoint aPoint = result.cgPointValue;
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodSize"
                                arguments:nil];
    CGSize aSize = result.cgSizeValue;
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodVector"
                                arguments:nil];
    CGVector aVector = result.cgVectorValue;
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodRect"
                                arguments:nil];
    CGRect aRect = result.cgRectValue;
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodRange"
                                arguments:nil];
    NSRange aRange = result.rangeValue;
    
    result = [LFXSuperRouter invokeModule:@"SomeObject"
                                  service:@"methodOffset"
                                arguments:nil];
    UIOffset aOffset = result.offsetValue;
    
    
    NSArray *argus = @[[NSValue valueWithCGSize:aSize],
                       [NSValue valueWithCGPoint:aPoint],
                       [NSValue valueWithCGVector:aVector],
                       [NSValue valueWithCGRect:aRect],
                       [NSValue valueWithRange:aRange],
                       [NSValue valueWithUIOffset:aOffset]];
    [LFXSuperRouter invokeModule:@"SomeObject"
                         service:@"methodWithSize:point:vector:rect:range:offset:"
                       arguments:argus];
    
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
    LFXSuperResult *result =
    [LFXSuperRouter invokeModule:@"ModuleONE" service:@"welcome" arguments:nil];
    
    NSLog(@"router return = %@", result);
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
