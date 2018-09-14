//
//  EncodeUtils.h
//  WWSecurity
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncodeUtils : NSObject

+ (NSString *)base64EncodeText2Base64:(NSString *)textString;
+ (NSString *)base64DecodeBase642Text:(NSString *)base64String;

+ (NSString *)base64EncodeData2Text:(NSData *)textData;
+ (NSData   *)base64DecodeText2Data:(NSString *)base64String;

+ (NSString *)URLEncodeString:(NSString *)textString;
+ (NSString *)URLDecodeString:(NSString *)encodedString;

+ (NSString *)dataToHexString:(NSData *)data;
+ (NSData   *)hexStringToData:(NSString *)hexString;



@end
