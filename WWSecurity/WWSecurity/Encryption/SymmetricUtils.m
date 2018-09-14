//
//  CryptoUtils.m
//  iOSAppLabo
//
//  Created by WiLL on 16/8/23.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import "SymmetricUtils.h"

#import <CommonCrypto/CommonCrypto.h>

#import "EncodeUtils.h"




@implementation SymmetricUtils




/**
 *  AES加密方法
 *
 *  @param plainText 明文
 *  @param password 密钥
 */
+ (NSString *)encryptedStringByAES:(NSString *)plainText password:(NSString *)password
{
    NSData *plainTextData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *cipherTextData = [SymmetricUtils encryptedByAES:plainTextData
                                                password:password];
    
    NSString *cipherText = [EncodeUtils dataToHexString:cipherTextData];
    return cipherText;
}

+ (NSData *)encryptedByAES:(NSData *)plainTextData password:(NSString *)password
{
    // init key
    NSInteger keySize = kCCKeySizeAES128;
    NSInteger keyLength = (password.length/keySize+1) * keySize+1;
    char *key = malloc(keyLength);
    bzero(key, keyLength);
    
    [password getCString:key maxLength:keyLength encoding:NSUTF8StringEncoding];
    
    for (int i = 0; i<keyLength; i++)
    {
        NSLog(@"%d", key[i]);
    }
    
    
    NSUInteger dataLength = [plainTextData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    bzero(buffer, bufferSize);
    
    CCCryptorStatus status = CCCrypt(kCCEncrypt,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding | kCCOptionECBMode,
                                     key,
                                     kCCBlockSizeAES128,
                                     NULL,
                                     [plainTextData bytes],
                                     dataLength,
                                     buffer,
                                     bufferSize,
                                     &bufferSize);
    if (status == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:bufferSize freeWhenDone:YES];
    }
    free(buffer);
    return nil;
}


/**
 *  解密方法
 *
 *  @param cipherText 密文
 *  @param password 密钥
 */
+ (NSString *)decryptedStringByAES:(NSString *)cipherText password:(NSString *)password
{
    NSData *cipherTextData = [EncodeUtils hexStringToData:cipherText];
    
    NSData *plainTextData = [SymmetricUtils decryptedByAES:cipherTextData
                                               password:password];
    
    NSString *plainText = [[NSString alloc] initWithData:plainTextData
                                                encoding:NSUTF8StringEncoding];
    return plainText;
}

+ (NSData *)decryptedByAES:(NSData *)cipherTextData password:(NSString *)password
{
    NSInteger keySize = kCCKeySizeAES128;
    NSInteger keyLength = (password.length/keySize+1) * keySize+1;
    char *key = malloc(keyLength);
    bzero(key, keyLength);
    
    [password getCString:key maxLength:keyLength encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [cipherTextData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          key,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [cipherTextData bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}






@end
