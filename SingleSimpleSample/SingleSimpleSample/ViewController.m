//
//  ViewController.m
//  SingleSimpleSample
//
//  Created by Shines Young on 2018/9/10.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "ViewController.h"

#import "WWInvokeArgus.h"
#import "WWRunLoopQueue.h"


@interface ViewController ()

@property (nonatomic, strong) WWRunLoopQueue *theQueue;

@end

@implementation ViewController

- (BOOL)myBoolMethod:(NSString *)string
{
    if (string.length > 0) {
        return YES;
    }
    return NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WWInvokeArgus *theArgus = [[WWInvokeArgus alloc] init];
    [theArgus addObject:@(0)];
    [theArgus addObject:@(1)];
    [theArgus addObject:nil];
    [theArgus addObject:@"3"];
    [theArgus addObject:@"unknown"];
    
    NSLog(@"after add : %@", theArgus);
    
    WWInvokeArgus *arg2 = [theArgus copy];
//    [arg2 addObject:@"4"];
    NSLog(@"after copy : %@", arg2);
    
    id aObj = [arg2 objectAtIndex:2];
    NSLog(@"2nd object of copy : %@", aObj);


    WWInvokeArgus *arg3 = [theArgus mutableCopy];
    [arg3 addObject:@"5"];
    NSLog(@"after copy : %@", arg3);
    NSLog(@"arg3 count : %ld", arg3.count);
    
    self.theQueue = [[WWRunLoopQueue alloc] init];
    [self.theQueue start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
