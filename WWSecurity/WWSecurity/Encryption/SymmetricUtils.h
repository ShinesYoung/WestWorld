//
//  CryptoUtils.h
//  iOSAppLabo
//
//  Created by WiLL on 16/8/23.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SymmetricUtils : NSObject





+ (NSString *)encryptedStringByAES:(NSString *)plainText password:(NSString *)password;
+ (NSString *)decryptedStringByAES:(NSString *)cipherText password:(NSString *)password;

+ (NSData *)encryptedByAES:(NSData *)plainTextData password:(NSString *)password;
+ (NSData *)decryptedByAES:(NSData *)cipherTextData password:(NSString *)password;





@end
