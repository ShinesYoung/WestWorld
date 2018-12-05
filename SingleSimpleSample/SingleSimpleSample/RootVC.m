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
#import "WWSuperResult.h"

#import "WWBaseModule.h"
#import "WWStringRouter.h"
//#import "WWConcurrentManager.h"

@interface RootVC ()

@end

@implementation RootVC

- (IBAction)onBtnClicked:(id)sender
{
    WWSuperInvoker *invoke = [WWSuperInvoker instance];
    WWSuperResult *result = nil;
    
    SomeObject *aObj = [[SomeObject alloc] init];

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodObject)];
    NSLog(@"methodObject return : %@", result.objectValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodBool)];
    NSLog(@"methodBool return : %d", result.boolValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodChar)];
    NSLog(@"methodChar return : %c", result.charValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedChar)];
    NSLog(@"methodUnsignedChar return : %c", result.unsignedCharValue);


    result = [invoke callInvocationOfInstance:aObj method:@selector(methodShort)];
    NSLog(@"methodShort return : %d", result.shortValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedShort)];
    NSLog(@"methodUnsignedShort return : %u", result.unsignedShortValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodInt)];
    NSLog(@"methodInt return : %d", result.intValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedInt)];
    NSLog(@"methodUnsignedInt return : %u", result.unsignedIntValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodLong)];
    NSLog(@"methodLong return : %ld", result.longValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedLong)];
    NSLog(@"methodUnsignedLong return : %lu", result.unsignedLongValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodLongLong)];
    NSLog(@"methodLongLong return : %lld", result.longLongValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedLongLong)];
    NSLog(@"methodUnsignedLongLong return : %llu", result.unsignedLongLongValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodFloat)];
    NSLog(@"methodFloat return : %f", result.floatValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodDouble)];
    NSLog(@"methodDouble return : %e", result.doubleValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodInteger)];
    NSLog(@"methodInteger return : %ld", result.integerValue);

    result = [invoke callInvocationOfInstance:aObj method:@selector(methodUnsignedInteger)];
    NSLog(@"methodUnsignedInteger return : %lu", result.unsignedIntegerValue);

    NSArray *arguments
    = @[@"This is a String", @(999999.999999), @[@"str1", @"str2", @"str3"],
        @{@"k1":@"v1", @"k2":@"v2"}, @(YES), @('X'), @('W'), @(-555), @555,
        @(-1234567890), @(1234567890), @(-1234567890), @(1234567890),
        @(12345.6789f), @(123456789.0), [NSNull null] ];

    SEL method = @selector(methodVoidWithString:number:array:dictionary:withBool:withChar:withUChar:withInt:withUInt:withLong:withULong:withInteger:withUInteger:withFloat:withDouble:withObject:);

    result = [invoke callInvocationOfInstance:aObj method:method
                                     arguments:arguments];
    NSLog(@"multiple argument method return : %@", result);
    [result print];


    result = [invoke callInvocationOfInstance:aObj
                                       method:NSSelectorFromString(@"methodPoint")];
    CGPoint aPoint = result.CGPointValue;
    NSLog(@"methodPoint return :%@", NSStringFromCGPoint(aPoint));

    result = [invoke callInvocationOfInstance:aObj
                                  method:NSSelectorFromString(@"methodSize")];
    CGSize aSize = result.CGSizeValue;
    NSLog(@"methodSize return :%@", NSStringFromCGSize(aSize));

    result = [invoke callInvocationOfInstance:aObj
                                  method:NSSelectorFromString(@"methodVector")];
    CGVector aVector = result.CGVectorValue;
    NSLog(@"methodVector return :%@", NSStringFromCGVector(aVector));

    result = [invoke callInvocationOfInstance:aObj
                                  method:NSSelectorFromString(@"methodRect")];
    CGRect aRect = result.CGRectValue;
    NSLog(@"methodRect return :%@", NSStringFromCGRect(aRect));

    result = [invoke callInvocationOfInstance:aObj
                                  method:NSSelectorFromString(@"methodRange")];
    NSRange aRange = result.rangeValue;
    NSLog(@"methodRange return :%@", NSStringFromRange(aRange));

    result = [invoke callInvocationOfInstance:aObj
                                  method:NSSelectorFromString(@"methodOffset")];
    UIOffset aOffset = result.UIOffsetValue;
    NSLog(@"methodOffset return :%@", NSStringFromUIOffset(aOffset));


    NSArray *argus = @[[NSValue valueWithCGSize:CGSizeMake(320, 480)],
                       [NSValue valueWithCGPoint:CGPointMake(160, 240)],
                       [NSValue valueWithCGVector:CGVectorMake(1.0, 1.0)],
                       [NSValue valueWithCGRect:CGRectMake(0, 0, 375, 667)],
                       [NSValue valueWithRange:NSMakeRange(1, 10)],
                       [NSValue valueWithUIOffset:UIOffsetMake(1.5, 1.5)]];
    [invoke callInvocationOfInstance:aObj
                         method:NSSelectorFromString(@"methodWithSize:point:vector:rect:range:offset:")
                       arguments:argus];

    handleBlock2 blockArg = ^BOOL(BOOL result,
                                      NSInteger returnCode,
                                      NSString *message)
    {
        NSLog(@"handleBlock2 called %d-%ld-%@", result, returnCode, message);
        return YES;
    };

    NSArray *arguments2 = @[blockArg];

    result = [invoke callInvocationOfInstance:aObj
                                       method:NSSelectorFromString(@"methodBlock:")
                               arguments:arguments2];

    handleBlock aBlock = (handleBlock) result.objectValue;
    if (aBlock) {
        aBlock (YES,0,@"OK");
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
    NSLog(@"@encode(block) = %s", objcType);
    
    const char *objcType2 = @encode(CGPoint);
    NSLog(@"@encode(CGPoint) = %s", objcType2);
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
