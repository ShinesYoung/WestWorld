//
//  DigestUtils.h
//  iOSAppLabo
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DigestUtils : NSObject

+ (NSString *)MD5:(NSString *)content;

+ (NSString *)SHA1:(NSString *)content;
+ (NSData *)SHA1Data:(NSString *)content;

@end
