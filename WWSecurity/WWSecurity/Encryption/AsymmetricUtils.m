//
//  AsymmetricUtils.m
//  iOSAppLabo
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import "AsymmetricUtils.h"

#import <CommonCrypto/CommonCrypto.h>

#import "EncodeUtils.h"
#import "DigestUtils.h"


@implementation AsymmetricUtils

/**
 *  RSA加密方法
 *
 *  @param plainText 明文
 *  @param publicKey 公钥
 */

+ (NSString *)RSAEncrypt:(NSString *)plainText  publicKey:(SecKeyRef)publicKey
{
    NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *cipherData = [AsymmetricUtils encryptedByRSA:plainData
                                               publicKey:publicKey];
    return [EncodeUtils base64EncodeData2Text:cipherData];
}


/**
 *  RSA加密方法
 *
 *  @param cipherText 密文
 *  @param privateKey 私钥
 */

+ (NSString *)RSADecrypt:(NSString *)cipherText privateKey:(SecKeyRef)privateKey
{
    NSData *cipherData = [EncodeUtils base64DecodeText2Data:cipherText];
    NSData *plainData = [AsymmetricUtils decryptedByRSA:cipherData
                                             privateKey:privateKey];
    
    return [[NSString alloc] initWithData:plainData
                                 encoding:NSUTF8StringEncoding];
}



+ (NSData *)encryptedByRSA:(NSData *)plainTextData publicKey:(SecKeyRef)publicKey
{
    size_t dataLength = (size_t)plainTextData.length;
    size_t cipherBufferSize = SecKeyGetBlockSize(publicKey);
    size_t blockSize = cipherBufferSize - 11;
    size_t blockCount = (size_t)ceil(dataLength / (double)blockSize);
    
    void *cipherBuffer = malloc(cipherBufferSize * sizeof(uint8_t));
    
    NSMutableData *cipherData = [[NSMutableData alloc] init];
    
    for (int i=0; i<blockCount; i++)
    {
        unsigned long bufferSize = MIN(blockSize , dataLength - i * blockSize);
        
        NSRange plainBufferRange = NSMakeRange(i * blockSize, bufferSize);
        NSData *plainBuffer = [plainTextData subdataWithRange:plainBufferRange];
        
        OSStatus status = SecKeyEncrypt(publicKey,
                                        kSecPaddingPKCS1,
                                        (const uint8_t *)[plainBuffer bytes],
                                        [plainBuffer length],
                                        cipherBuffer,
                                        &cipherBufferSize);
        
        if (status != noErr) {return nil;}
        
        NSData *cipherDataBlcok = [[NSData alloc]
                                   initWithBytes:(const void *)cipherBuffer
                                   length:cipherBufferSize];
        [cipherData appendData:cipherDataBlcok];
    }
    
    if (cipherBuffer) {free(cipherBuffer);}
    CFRelease(publicKey);
    
    return cipherData;

}

+ (NSData *)decryptedByRSA:(NSData *)cipherTextData privateKey:(SecKeyRef)privateKey
{
    size_t dataLength = (size_t)cipherTextData.length;
    size_t plainBufferSize = SecKeyGetBlockSize(privateKey);
    size_t blockSize = plainBufferSize;
    size_t blockCount = (size_t)ceil(dataLength / (double)blockSize);
    
    void *plainBuffer = malloc(plainBufferSize * sizeof(uint8_t));
    
    NSMutableData *plainData = [[NSMutableData alloc] init];
    
    for (int i = 0; i < blockCount; i++)
    {
        unsigned long bufferSize = MIN(blockSize , dataLength - i * blockSize);
        
        NSRange cipherBufferRange = NSMakeRange(i * blockSize, bufferSize);
        NSData *cipherBuffer = [cipherTextData subdataWithRange:cipherBufferRange];
        
        OSStatus status = SecKeyDecrypt(privateKey,
                                        kSecPaddingPKCS1,
                                        (const uint8_t *)[cipherBuffer bytes],
                                        bufferSize,
                                        plainBuffer,
                                        &plainBufferSize);
        
        if (status != noErr) { return nil; }
        
        NSData *plainDataBlock = [[NSData alloc]
                                  initWithBytes:(const void *)plainBuffer
                                  length:plainBufferSize];
        [plainData appendData:plainDataBlock];
    }
    if (plainBuffer) {free(plainBuffer);}
    CFRelease(privateKey);
    
    return plainData;
    
}





/**
 *  RSA签名 & 验签
 *
 *  @param plainText 明文
 *  @param privateKey 密钥
 */

+ (NSString *)RSASign:(NSString *)plainText privateKey:(SecKeyRef)privateKey
{
    NSData *bPlainText = [DigestUtils SHA1Data:plainText];
    
    NSData *signData = [AsymmetricUtils sign:bPlainText privateKey:privateKey];
    
    return [EncodeUtils base64EncodeData2Text:signData];
}


/**
 *  RSA签名 & 验签
 *
 *  @param sign 签名
 *  @param plainText 明文
 *  @param publicKey 密钥
 */

+ (BOOL)RSAVerify:(NSString *)sign publicKey:(SecKeyRef)publicKey plainText:(NSString *)plainText
{
    NSData *signData = [EncodeUtils base64DecodeText2Data:sign];
    
    NSData *bPlainText = [DigestUtils SHA1Data:plainText];
    
    return [AsymmetricUtils verify:signData publicKey:publicKey plainText:bPlainText];
}

+ (NSData *)sign:(NSData *)bPlainText privateKey:(SecKeyRef)privateKey
{
    const char * data = [bPlainText bytes];
    size_t dataSize = strlen(data);
    
    size_t signBytesSize = SecKeyGetBlockSize(privateKey);
    uint8_t *signBytes = malloc(signBytesSize);
    
    OSStatus status = SecKeyRawSign(privateKey,
                                    kSecPaddingPKCS1SHA1,
                                    (const uint8_t *)data,
                                    dataSize,
                                    signBytes,
                                    &signBytesSize);
    
    if (status != noErr) { return nil; }
    
    NSData *signData = [[NSData alloc] initWithBytes:signBytes length:signBytesSize];
    
    return signData;
}

+ (BOOL)verify:(NSData *)signData publicKey:(SecKeyRef)publicKey plainText:(NSData *)bPlainText
{
    const char * signBytes = [signData bytes];
    size_t signBytesSize = strlen(signBytes);
    
    const char * hashBytes = [bPlainText bytes];
    size_t hashBytesSize = strlen(hashBytes);
    
    OSStatus status = SecKeyRawVerify(publicKey,
                                      kSecPaddingPKCS1SHA1,
                                      (const uint8_t *)hashBytes,
                                      hashBytesSize,
                                      (const uint8_t *)signBytes,
                                      signBytesSize);
    NSLog(@"verify result = %d", (int)status);
    
    return (status == noErr) ? YES : NO;
}



//根据你的p12文件生成私钥对应的SecKeyRef 这边返回若是nil 请检查你p12文件的生成步骤
+ (SecKeyRef)getPrivateKeyReferenceFromData:(NSData*)p12Data password:(NSString*)password
{
    
    SecKeyRef privateKeyRef = NULL;
    NSMutableDictionary * options = [[NSMutableDictionary alloc] init];
    [options setObject: password forKey:(__bridge id)kSecImportExportPassphrase];
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    OSStatus securityError = SecPKCS12Import((__bridge CFDataRef) p12Data,
                                             (__bridge CFDictionaryRef)options, &items);
    if (securityError == noErr && CFArrayGetCount(items) > 0)
    {
        CFDictionaryRef identityDict = CFArrayGetValueAtIndex(items, 0);
        SecIdentityRef identityApp = (SecIdentityRef)CFDictionaryGetValue(identityDict, kSecImportItemIdentity);
        securityError = SecIdentityCopyPrivateKey(identityApp, &privateKeyRef);
        if (securityError != noErr) {
            privateKeyRef = NULL;
        }
    }
    CFRelease(items);
    
    return privateKeyRef;
}


//根据你的der文件公钥对应的SecKeyRef
+ (SecKeyRef)getPublicKeyReferenceFromData: (NSData*)derData
{
    
    SecCertificateRef myCertificate = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)derData);
    SecPolicyRef myPolicy = SecPolicyCreateBasicX509();
    SecTrustRef myTrust;
    OSStatus status = SecTrustCreateWithCertificates(myCertificate,myPolicy,&myTrust);
    SecTrustResultType trustResult;
    if (status == noErr) {
        status = SecTrustEvaluate(myTrust, &trustResult);
    }
    SecKeyRef securityKey = SecTrustCopyPublicKey(myTrust);
    CFRelease(myCertificate);
    CFRelease(myPolicy);
    CFRelease(myTrust);
    
    return securityKey;
}

@end
