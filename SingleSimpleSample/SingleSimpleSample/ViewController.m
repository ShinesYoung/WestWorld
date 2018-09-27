//
//  ViewController.m
//  SingleSimpleSample
//
//  Created by Shines Young on 2018/9/10.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)myBoolMethod:(NSString *)string
{
    if (string.length > 0) {
        return YES;
    }
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SEL sel = @selector(myBoolMethod:);
    IMP imp = [self methodForSelector:sel];
    
    NSLog(@"IMP = %@", imp);
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
