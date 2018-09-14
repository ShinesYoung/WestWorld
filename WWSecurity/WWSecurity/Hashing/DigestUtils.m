//
//  DigestUtils.m
//  iOSAppLabo
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import "DigestUtils.h"

#import <CommonCrypto/CommonCrypto.h>



@implementation DigestUtils

+ (NSString *)MD5:(NSString *)content
{
    const char *cStr = [content UTF8String];
    CC_LONG strLen = (CC_LONG)strlen(cStr);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    bzero(digest, CC_MD5_DIGEST_LENGTH);
    
    CC_MD5( cStr, strLen, digest ); // This is the md5 call
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x"
             "%02x%02x%02x%02x%02x%02x%02x%02x",
    digest[0], digest[1], digest[2], digest[3], digest[4], digest[5], digest[6], digest[7],
    digest[8], digest[9], digest[10],digest[11],digest[12],digest[13],digest[14],digest[15]];
}

+ (NSString *)SHA1:(NSString *)content
{
    const char *cStr = [content UTF8String];
    CC_LONG strLen = (CC_LONG)strlen(cStr);
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    bzero(digest, CC_SHA1_DIGEST_LENGTH);
    
    CC_SHA1(cStr, strLen, digest);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x"
             "%02x%02x%02x%02x%02x"
             "%02x%02x%02x%02x%02x"
             "%02x%02x%02x%02x%02x",
    digest[0], digest[1], digest[2], digest[3], digest[4],
    digest[5], digest[6], digest[7], digest[8], digest[9],
    digest[10],digest[11],digest[12],digest[13],digest[14],
    digest[15],digest[16],digest[17],digest[18],digest[19]];
}

+ (NSData *)SHA1Data:(NSString *)content
{
    const char *cStr = [content UTF8String];
    CC_LONG strLen = (CC_LONG)strlen(cStr);
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    bzero(digest, CC_SHA1_DIGEST_LENGTH);
    
    CC_SHA1(cStr, strLen, digest);
    
    return [[NSData alloc] initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
}

@end
