//
//  WWArguments.h
//  WWFoundation
//
//  Created by Shines Young on 2018/12/3.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWArguments : NSMutableArray

@property (nonatomic, strong) NSMutableArray *arguments;

#pragma mark - init method
- (instancetype)init;
- (instancetype)initWithCapacity:(NSUInteger)numItems;
- (instancetype)initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt;
- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithContentsOfURL:(NSURL *)url;

#pragma mark - NSArray primitive method
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

#pragma mark - NSMutableArray primitive method
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)removeLastObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;


@end
