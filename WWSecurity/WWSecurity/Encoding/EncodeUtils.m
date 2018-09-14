//
//  EncodeUtils.m
//  WWSecurity
//
//  Created by WiLL on 16/10/11.
//  Copyright © 2016年 Shfft. All rights reserved.
//

#import "EncodeUtils.h"

#import "GTMBase64.h"



@implementation EncodeUtils


/**
 *  Base64 编码方法
 *
 *  @param textString 明文
 *  @return stringWithBase64Encode
 */
+ (NSString *)base64EncodeText2Base64:(NSString *)textString
{
    return [GTMBase64 encodeBase64String:textString];
}


/**
 *  Base64 解码方法
 *
 *  @param base64String 密文
 */
+ (NSString *)base64DecodeBase642Text:(NSString *)base64String
{
    return [GTMBase64 decodeBase64String:base64String];
}

+ (NSString *)base64EncodeData2Text:(NSData *)textData
{
    return [GTMBase64 encodeBase64Data:textData];
}

+ (NSData *)base64DecodeText2Data:(NSString *)base64String
{
    return [GTMBase64 decodeString:base64String];
}






/**
 *  URLEncode URL编码转码方法
 *
 *  @param textString 明文
 *  @return 转码后的字符串
 */
+ (NSString *)URLEncodeString:(NSString *)textString
{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)textString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

/**
 *  URLDecode URL编码解码方法
 *
 *  @param encodedString 转码密文
 *  @return 解码后的字符串
 */
+ (NSString *)URLDecodeString:(NSString *)encodedString

{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *decodedString
    = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
        (__bridge CFStringRef)encodedString, CFSTR(""),
        CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}







/**
 *  工具方法 byte to hex
 *
 *  @param data 2进制byte数组
 *  @return 16进制String
 */

+ (NSString *)dataToHexString:(NSData *)data
{
    const unsigned char *dataBuffer = (const unsigned char *)[data bytes];
    
    if (!dataBuffer)
    {
        return [NSString string];
    }
    
    NSUInteger      dataLength = [data length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
    {
        [hexString appendFormat:@"%02x", (unsigned int)dataBuffer[i]];
    }
    
    return [NSString stringWithString:hexString];
    
}


/**
 *  工具方法 hex to String
 *
 *  @param hexString 16进制String
 *  @return 2进制byte数组
 */

+ (NSData *)hexStringToData:(NSString *)hexString
{
    const char *chars = [hexString UTF8String];
    int i = 0;
    int len = (int)hexString.length;
    NSMutableData *data = [NSMutableData dataWithCapacity:len/2];
    char byteChars[3] = {'\0','\0','\0'};
    unsigned long wholeByte;
    
    while (i<len)
    {
        byteChars[0] = chars[i++];
        byteChars[1] = chars[i++];
        wholeByte = strtoul(byteChars, NULL, 16);
        [data appendBytes:&wholeByte length:1];
    }
    return data;
}



@end
