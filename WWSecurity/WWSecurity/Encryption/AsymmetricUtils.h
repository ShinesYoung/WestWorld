//
//  AsymmetricUtils.h
//  iOSAppLabo
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AsymmetricUtils : NSObject

+ (NSString *)RSAEncrypt:(NSString *)plainText  publicKey:(SecKeyRef)publicKey;
+ (NSString *)RSADecrypt:(NSString *)cipherText privateKey:(SecKeyRef)privateKey;


+ (NSString *)RSASign:(NSString *)plainText privateKey:(SecKeyRef)privateKey;
+ (BOOL)RSAVerify:(NSString *)sign publicKey:(SecKeyRef)publicKey plainText:(NSString *)plainText;


+ (SecKeyRef)getPrivateKeyReferenceFromData:(NSData*)p12Data password:(NSString*)password;
+ (SecKeyRef)getPublicKeyReferenceFromData:(NSData*)derData;


@end
