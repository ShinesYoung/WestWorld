//
//  WWArguments.m
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWInvokeArgus.h"

@implementation WWInvokeArgus

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arguments = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self) {
        self.arguments = [[NSMutableArray alloc] initWithCapacity:numItems];
    }
    return self;
}

- (instancetype)initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    self = [super init];
    if (self) {
        self.arguments = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.arguments = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}

- (instancetype)initWithContentsOfURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.arguments = [[NSMutableArray alloc] initWithContentsOfURL:url];
    }
    return self;
}

#pragma mark - NSArray primitive method

- (NSUInteger)count
{
    return self.arguments.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    if (index >= self.arguments.count) {
        return nil;
    }
    return [self.arguments objectAtIndex:index];
}

#pragma mark - NSMutableArray primitive method

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject == nil) {
        anObject = [NSNull null];
    }
    if (index > self.arguments.count) {
        index = self.arguments.count;
    }
    
    [self.arguments insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.arguments.count) {
        return;
    }
    [self.arguments removeObjectAtIndex:index];
}

- (void)addObject:(id)anObject
{
    if (anObject == nil) {
        anObject = [NSNull null];
    }
    [self.arguments addObject:anObject];
}

- (void)removeLastObject
{
    [self.arguments removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject == nil) {
        anObject = [NSNull null];
    }
    if (index > self.arguments.count) {
        index = self.arguments.count;
    }
    [self.arguments replaceObjectAtIndex:index withObject:anObject];
}


@end
