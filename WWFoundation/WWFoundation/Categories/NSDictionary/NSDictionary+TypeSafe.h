//
//  NSDictionary+TypeSafe.h
//  WWFoundation
//
//  Created by Shines Young on 2018/10/19.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>



/*********************** Category Definition - TypeSafe ***********************/
#pragma mark - Category Definition - TypeSafe

@interface NSDictionary (TypeSafe)

#pragma mark - ForKey

- (BOOL)ww_boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;
- (BOOL)ww_boolForKey:(NSString *)key;
- (NSInteger)ww_integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;
- (NSInteger)ww_integerForKey:(NSString *)key;
- (NSUInteger)ww_unsignedIntegerForKey:(NSString *)key defaultValue:(NSUInteger)defaultValue;
- (NSUInteger)ww_unsignedIntegerForKey:(NSString *)key;
- (char)ww_charForKey:(NSString *)key defaultValue:(char)defaultValue;
- (char)ww_charForKey:(NSString *)key;
- (unsigned char)ww_unsignedCharForKey:(NSString *)key defaultValue:(unsigned char)defaultValue;
- (unsigned char)ww_unsignedCharForKey:(NSString *)key;
- (short)ww_shortForKey:(NSString *)key defaultValue:(short)defaultValue;
- (short)ww_shortForKey:(NSString *)key;
- (unsigned short)ww_unsignedShortForKey:(NSString *)key defaultValue:(unsigned short)defaultValue;
- (unsigned short)ww_unsignedShortForKey:(NSString *)key;
- (long)ww_longForKey:(NSString *)key defaultValue:(long)defaultValue;
- (long)ww_longForKey:(NSString *)key;
- (unsigned long)ww_unsignedLongForKey:(NSString *)key defaultValue:(unsigned long)defaultValue;
- (unsigned long)ww_unsignedLongForKey:(NSString *)key;
- (long long)ww_longLongForKey:(NSString *)key defaultValue:(long long)defaultValue;
- (long long)ww_longLongForKey:(NSString *)key;
- (unsigned long long)ww_unsignedLongLongForKey:(NSString *)key defaultValue:(unsigned long long)defaultValue;
- (unsigned long long)ww_unsignedLongLongForKey:(NSString *)key;
- (float)ww_floatForKey:(NSString *)key defaultValue:(float)defaultValue;
- (float)ww_floatForKey:(NSString *)key;
- (double)ww_doubleForKey:(NSString *)key defaultValue:(double)defaultValue;
- (double)ww_doubleForKey:(NSString *)key;
- (NSTimeInterval)ww_timeIntervalForKey:(NSString *)key defaultValue:(NSTimeInterval)defaultValue;
- (NSTimeInterval)ww_timeIntervalForKey:(NSString *)key;
- (id)ww_objectForKey:(NSString *)key defaultValue:(id)defaultValue;
- (id)ww_objectForKey:(NSString *)key;
- (NSString *)ww_stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSString *)ww_stringForKey:(NSString *)key;
- (NSArray *)ww_arrayForKey:(NSString *)key defaultValue:(NSArray *)defaultValue;
- (NSArray *)ww_arrayForKey:(NSString *)key;
- (NSDictionary *)ww_dictionaryForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue;
- (NSDictionary *)ww_dictionaryForKey:(NSString *)key;
- (NSDate *)ww_dateForKey:(NSString *)key defaultValue:(NSDate *)defaultValue;
- (NSDate *)ww_dateForKey:(NSString *)key;
- (NSData *)ww_dataForKey:(NSString *)key defaultValue:(NSData *)defaultValue;
- (NSData *)ww_dataForKey:(NSString *)key;
- (NSURL *)ww_URLForKey:(NSString *)key defaultValue:(NSURL *)defaultValue;
- (NSURL *)ww_URLForKey:(NSString *)key;

#pragma mark - ForPath

- (BOOL)ww_boolForPath:(NSString *)path defaultValue:(BOOL)defaultValue;
- (BOOL)ww_boolForPath:(NSString *)path;
- (NSInteger)ww_integerForPath:(NSString *)path defaultValue:(NSInteger)defaultValue;
- (NSInteger)ww_integerForPath:(NSString *)path;
- (NSUInteger)ww_unsignedIntegerForPath:(NSString *)path defaultValue:(NSUInteger)defaultValue;
- (NSUInteger)ww_unsignedIntegerForPath:(NSString *)path;
- (char)ww_charForPath:(NSString *)key defaultValue:(char)defaultValue;
- (char)ww_charForPath:(NSString *)key;
- (unsigned char)ww_unsignedCharForPath:(NSString *)key defaultValue:(unsigned char)defaultValue;
- (unsigned char)ww_unsignedCharForPath:(NSString *)key;
- (short)ww_shortForPath:(NSString *)key defaultValue:(short)defaultValue;
- (short)ww_shortForPath:(NSString *)key;
- (unsigned short)ww_unsignedShortForPath:(NSString *)key defaultValue:(unsigned short)defaultValue;
- (unsigned short)ww_unsignedShortForPath:(NSString *)key;
- (long)ww_longForPath:(NSString *)key defaultValue:(long)defaultValue;
- (long)ww_longForPath:(NSString *)key;
- (unsigned long)ww_unsignedLongForPath:(NSString *)key defaultValue:(unsigned long)defaultValue;
- (unsigned long)ww_unsignedLongForPath:(NSString *)key;
- (long long)ww_longLongForPath:(NSString *)key defaultValue:(long long)defaultValue;
- (long long)ww_longLongForPath:(NSString *)key;
- (unsigned long long)ww_unsignedLongLongForPath:(NSString *)key defaultValue:(unsigned long long)defaultValue;
- (unsigned long long)ww_unsignedLongLongForPath:(NSString *)key;
- (float)ww_floatForPath:(NSString *)path defaultValue:(float)defaultValue;
- (float)ww_floatForPath:(NSString *)path;
- (double)ww_doubleForPath:(NSString *)path defaultValue:(double)defaultValue;
- (double)ww_doubleForPath:(NSString *)path;
- (NSObject *)ww_objectForPath:(NSString *)path defaultValue:(NSObject *)defaultValue;
- (NSObject *)ww_objectForPath:(NSString *)path;
- (NSString *)ww_stringForPath:(NSString *)path defaultValue:(NSString *)defaultValue;
- (NSString *)ww_stringForPath:(NSString *)path;
- (NSArray *)ww_arrayForPath:(NSString *)path defaultValue:(NSArray *)defaultValue;
- (NSArray *)ww_arrayForPath:(NSString *)path;
- (NSDictionary *)ww_dictionaryForPath:(NSString *)path defaultValue:(NSDictionary *)defaultValue;
- (NSDictionary *)ww_dictionaryForPath:(NSString *)path;
- (NSDate *)ww_dateForPath:(NSString *)path defaultValue:(NSDate *)defaultValue;
- (NSDate *)ww_dateForPath:(NSString *)path;
- (NSData *)ww_dataForPath:(NSString *)path defaultValue:(NSData *)defaultValue;
- (NSData *)ww_dataForPath:(NSString *)path;
- (NSURL *)ww_URLForPath:(NSString *)key defaultValue:(NSURL *)defaultValue;
- (NSURL *)ww_URLForPath:(NSString *)key;

@end

