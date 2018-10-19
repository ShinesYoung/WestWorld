//
//  NSDictionary+TypeSafe.m
//  WWFoundation
//
//  Created by Shines Young on 2018/10/19.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "NSDictionary+TypeSafe.h"


/********************* Category Implementation - TypeSafe *********************/
#pragma mark - Category Implementation - TypeSafe

@implementation NSDictionary (TypeSafe)

#pragma mark - ForKey

- (BOOL)ww_boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj boolValue];
    } else {
        return defaultValue;
    }
}

- (BOOL)ww_boolForKey:(NSString *)key
{
    return [self ww_boolForKey:key defaultValue:NO];
}

- (NSInteger)ww_integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj integerValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return [(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (NSInteger)ww_integerForKey:(NSString *)key
{
    return [self ww_integerForKey:key defaultValue:0];
}

- (NSUInteger)ww_unsignedIntegerForKey:(NSString *)key defaultValue:(NSUInteger)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj unsignedIntegerValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (NSInteger)strtoul([(NSString *)obj UTF8String], NULL, 0);
        }
    }
    
    return defaultValue;
}

- (NSUInteger)ww_unsignedIntegerForKey:(NSString *)key
{
    return [self ww_unsignedIntegerForKey:key defaultValue:0];
}

- (char)ww_charForKey:(NSString *)key defaultValue:(char)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj charValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (char)[(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (char)ww_charForKey:(NSString *)key
{
    return [self ww_charForKey:key defaultValue:0];
}

- (unsigned char)ww_unsignedCharForKey:(NSString *)key defaultValue:(unsigned char)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj unsignedCharValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (unsigned char)[(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (unsigned char)ww_unsignedCharForKey:(NSString *)key
{
    return [self ww_unsignedCharForKey:key defaultValue:0];
}

- (short)ww_shortForKey:(NSString *)key defaultValue:(short)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj shortValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (short)[(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (short)ww_shortForKey:(NSString *)key
{
    return [self ww_shortForKey:key defaultValue:0];
}

- (unsigned short)ww_unsignedShortForKey:(NSString *)key defaultValue:(unsigned short)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj unsignedShortValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (unsigned short)[(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (unsigned short)ww_unsignedShortForKey:(NSString *)key
{
    return [self ww_unsignedShortForKey:key defaultValue:0];
}

- (long)ww_longForKey:(NSString *)key defaultValue:(long)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj longValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (long)[(NSString *)obj integerValue];
        }
    }
    
    return defaultValue;
}

- (long)ww_longForKey:(NSString *)key
{
    return [self ww_longForKey:key defaultValue:0];
}

- (unsigned long)ww_unsignedLongForKey:(NSString *)key defaultValue:(unsigned long)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj unsignedLongValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (unsigned long)strtoul([(NSString *)obj UTF8String], NULL, 0);
        }
    }
    
    return defaultValue;
}

- (unsigned long)ww_unsignedLongForKey:(NSString *)key
{
    return [self ww_unsignedLongForKey:key defaultValue:0];
}

- (long long)ww_longLongForKey:(NSString *)key defaultValue:(long long)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj longLongValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (long long)strtoll([(NSString *)obj UTF8String], NULL, 0);
        }
    }
    
    return defaultValue;
}

- (long long)ww_longLongForKey:(NSString *)key
{
    return [self ww_longLongForKey:key defaultValue:0];
}

- (unsigned long long)ww_unsignedLongLongForKey:(NSString *)key defaultValue:(unsigned long long)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj unsignedLongLongValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return (unsigned long long)strtoull([(NSString *)obj UTF8String], NULL, 0);
        }
    }
    
    return defaultValue;
}

- (unsigned long long)ww_unsignedLongLongForKey:(NSString *)key
{
    return [self ww_unsignedLongLongForKey:key defaultValue:0];
}

- (float)ww_floatForKey:(NSString *)key defaultValue:(float)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj floatValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return [(NSString *)obj floatValue];
        }
    }
    
    return defaultValue;
}

- (float)ww_floatForKey:(NSString *)key
{
    return [self ww_floatForKey:key defaultValue:0];
}

- (double)ww_doubleForKey:(NSString *)key defaultValue:(double)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj doubleValue];
        } else if ([obj isKindOfClass:[NSString class]]) {
            return [(NSString *)obj doubleValue];
        }
    }
    
    return defaultValue;
}

- (double)ww_doubleForKey:(NSString *)key
{
    return [self ww_doubleForKey:key defaultValue:0];
}

- (NSTimeInterval)ww_timeIntervalForKey:(NSString *)key defaultValue:(NSTimeInterval)defaultValue
{
    return [self ww_doubleForKey:key defaultValue:defaultValue];
}

- (NSTimeInterval)ww_timeIntervalForKey:(NSString *)key
{
    return [self ww_doubleForKey:key defaultValue:0];
}

- (id)ww_objectForKey:(NSString *)key defaultValue:(NSString *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (id)ww_objectForKey:(NSString *)key
{
    return [self ww_objectForKey:key defaultValue:nil];
}

- (NSString *)ww_stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            return obj;
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)obj stringValue];
        }
    }
    
    return defaultValue;
}

- (NSString *)ww_stringForKey:(NSString *)key
{
    return [self ww_stringForKey:key defaultValue:nil];
}

- (NSArray *)ww_arrayForKey:(NSString *)key defaultValue:(NSArray *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSArray class]]) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (NSArray *)ww_arrayForKey:(NSString *)key
{
    return [self ww_arrayForKey:key defaultValue:nil];
}

- (NSDictionary *)ww_dictionaryForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (NSDictionary *)ww_dictionaryForKey:(NSString *)key
{
    return [self ww_dictionaryForKey:key defaultValue:nil];
}

- (NSDate *)ww_dateForKey:(NSString *)key defaultValue:(NSDate *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSDate class]]) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (NSDate *)ww_dateForKey:(NSString *)key
{
    return [self ww_dateForKey:key defaultValue:nil];
}

- (NSData *)ww_dataForKey:(NSString  *)key defaultValue:(NSData *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSData class]]) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (NSData *)ww_dataForKey:(NSString *)key
{
    return [self ww_dataForKey:key defaultValue:nil];
}

- (NSURL *)ww_URLForKey:(NSString *)key defaultValue:(NSURL *)defaultValue
{
    id obj = [self objectForKey:key];
    if (obj && [obj isKindOfClass:[NSURL class]]) {
        return obj;
    } else {
        return defaultValue;
    }
}

- (NSURL *)ww_URLForKey:(NSString *)key
{
    return [self ww_URLForKey:key defaultValue:nil];
}

#pragma mark - ForPath

- (NSDictionary *)ww_dictionaryForPaths:(NSArray *)paths
{
    if (paths.count == 0) {
        return nil;
    }
    
    NSDictionary *target = self;
    for (int i = 0; i < paths.count - 1; i++) {
        NSString *key = [paths objectAtIndex:i];
        target = [target ww_dictionaryForKey:key];
        if (!target) {
            return nil;
        }
    }
    
    return target;
}

- (BOOL)ww_boolForPath:(NSString *)path defaultValue:(BOOL)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_boolForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_boolForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (BOOL)ww_boolForPath:(NSString *)path
{
    return [self ww_boolForPath:path defaultValue:NO];
}

- (NSInteger)ww_integerForPath:(NSString *)path defaultValue:(NSInteger)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_integerForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_integerForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSInteger)ww_integerForPath:(NSString *)path
{
    return [self ww_integerForPath:path defaultValue:0];
}

- (NSUInteger)ww_unsignedIntegerForPath:(NSString *)path defaultValue:(NSUInteger)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_unsignedIntegerForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_unsignedIntegerForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSUInteger)ww_unsignedIntegerForPath:(NSString *)path
{
    return [self ww_unsignedIntegerForPath:path defaultValue:0];
}

- (char)ww_charForPath:(NSString *)path defaultValue:(char)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_charForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_charForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (char)ww_charForPath:(NSString *)path
{
    return [self ww_charForPath:path defaultValue:0];
}

- (unsigned char)ww_unsignedCharForPath:(NSString *)path defaultValue:(unsigned char)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_unsignedCharForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_unsignedCharForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (unsigned char)ww_unsignedCharForPath:(NSString *)path
{
    return [self ww_unsignedCharForPath:path defaultValue:0];
}

- (short)ww_shortForPath:(NSString *)path defaultValue:(short)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_shortForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_shortForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (short)ww_shortForPath:(NSString *)path
{
    return [self ww_shortForPath:path defaultValue:0];
}

- (unsigned short)ww_unsignedShortForPath:(NSString *)path defaultValue:(unsigned short)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_unsignedShortForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_unsignedShortForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (unsigned short)ww_unsignedShortForPath:(NSString *)path
{
    return [self ww_unsignedShortForPath:path defaultValue:0];
}

- (long)ww_longForPath:(NSString *)path defaultValue:(long)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_longForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_longForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (long)ww_longForPath:(NSString *)path
{
    return [self ww_longForPath:path defaultValue:0];
}

- (unsigned long)ww_unsignedLongForPath:(NSString *)path defaultValue:(unsigned long)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_unsignedLongForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_unsignedLongForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (unsigned long)ww_unsignedLongForPath:(NSString *)path
{
    return [self ww_unsignedLongForPath:path defaultValue:0];
}

- (long long)ww_longLongForPath:(NSString *)path defaultValue:(long long)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_longLongForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_longLongForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (long long)ww_longLongForPath:(NSString *)path
{
    return [self ww_longLongForPath:path defaultValue:0];
}

- (unsigned long long)ww_unsignedLongLongForPath:(NSString *)path defaultValue:(unsigned long long)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_longLongForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_unsignedLongLongForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (unsigned long long)ww_unsignedLongLongForPath:(NSString *)path
{
    return [self ww_unsignedLongLongForPath:path defaultValue:0];
}

- (float)ww_floatForPath:(NSString *)path
{
    return [self ww_floatForPath:path defaultValue:0];
}

- (float)ww_floatForPath:(NSString *)path defaultValue:(float)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_floatForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_floatForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (double)ww_doubleForPath:(NSString *)path
{
    return [self ww_doubleForPath:path defaultValue:0];
}

- (double)ww_doubleForPath:(NSString *)path defaultValue:(double)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_doubleForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_doubleForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSObject *)ww_objectForPath:(NSString *)path defaultValue:(NSObject *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_objectForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_objectForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSObject *)ww_objectForPath:(NSString *)path
{
    return [self ww_objectForPath:path defaultValue:nil];
}

- (NSString *)ww_stringForPath:(NSString *)path defaultValue:(NSString *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_stringForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_stringForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSString *)ww_stringForPath:(NSString *)path
{
    return [self ww_stringForPath:path defaultValue:nil];
}

- (NSArray *)ww_arrayForPath:(NSString *)path defaultValue:(NSArray *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_arrayForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_arrayForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSArray *)ww_arrayForPath:(NSString *)path
{
    return [self ww_arrayForPath:path defaultValue:nil];
}

- (NSDictionary *)ww_dictionaryForPath:(NSString *)path defaultValue:(NSDictionary *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_dictionaryForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_dictionaryForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSDictionary *)ww_dictionaryForPath:(NSString *)path
{
    return [self ww_dictionaryForPath:path defaultValue:nil];
}

- (NSDate *)ww_dateForPath:(NSString *)path defaultValue:(NSDate *)defaultValue {
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_dateForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_dateForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSDate *)ww_dateForPath:(NSString *)path {
    return [self ww_dateForPath:path defaultValue:nil];
}

- (NSData *)ww_dataForPath:(NSString *)path defaultValue:(NSData *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_dataForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_dataForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSData *)ww_dataForPath:(NSString *)path
{
    return [self ww_dataForPath:path defaultValue:nil];
}

- (NSURL *)ww_URLForPath:(NSString *)path defaultValue:(NSURL *)defaultValue
{
    NSArray *paths = [path componentsSeparatedByString:@"."];
    if (paths.count == 1) {
        return [self ww_URLForKey:paths.lastObject];
    } else if (paths.count >= 2) {
        NSDictionary *obj = [self ww_dictionaryForPaths:paths];
        return [obj ww_URLForKey:paths.lastObject];
    }
    
    return defaultValue;
}

- (NSURL *)ww_URLForPath:(NSString *)path
{
    return [self ww_URLForPath:path defaultValue:nil];
}

@end
