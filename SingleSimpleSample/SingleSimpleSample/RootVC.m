//
//  RootVC.m
//  SingleSimpleSample
//
//  Created by Shines Young on 2018/9/10.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "RootVC.h"

#import <JavaScriptCore/JavaScriptCore.h>

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JSContext *jsContext = [[JSContext alloc] init];
    JSValue *jsValue = [JSValue valueWithNewObjectInContext:jsContext];
    
//    [jsContext evaluateScript:<#(NSString *)#>];
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
