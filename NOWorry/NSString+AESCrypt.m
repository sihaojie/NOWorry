//
//  NSString+AESCrypt.m
//  test
//
//  Created by 司浩杰 on 16/1/17.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

#import "NSString+AESCrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (AESCrypt)

- (NSString *)AES128EncryptWithKey:(NSString *)key
{
    //先填充空格,以保证待加密字符串长度为16的倍数
    int nSrcLen = [self length];
    int nDstLen = 0;
    if (nSrcLen % 16 == 0) {
        nDstLen = nSrcLen;
    } else {
        nDstLen = (nSrcLen/16+1)*16;
    }
    NSMutableString *strNewPlain = [NSMutableString stringWithString:self];
    for (int i=0; i<nDstLen-nSrcLen; i++) {
        [strNewPlain appendString:@" "];
    }
    
    //加密
    NSData *plainData = [strNewPlain dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [plainData AES128EncryptWithKey:key];
    
    //输出16进制字符串
    int nLen = [encryptedData length];
    const uint8_t *bytes = (uint8_t*)[encryptedData bytes];
    NSMutableString* encryptedString = [NSMutableString stringWithCapacity:nLen * 2];
    for(int i = 0; i < nLen; i++)
        [encryptedString appendFormat:@"%02x", bytes[i]];
    
    return encryptedString;
}

- (NSString *)AES128DecryptWithKey:(NSString *)key
{
    //将16进制字符串转换为16进制数
    const char *hexChars = [self UTF8String];
    NSUInteger hexLen = strlen(hexChars);
    char *binChars = malloc(hexLen/2);
    const char *nextHex = hexChars;
    char *nextChar = binChars;
    for (NSUInteger i = 0; i < hexLen - 1; i++)
    {
        sscanf(nextHex, "%2x", (unsigned int*)nextChar);
        nextHex += 2;
        nextChar++;
    }
    
    //解密
    NSData *encryptedData = [NSData dataWithBytes:binChars length:hexLen/2];
    NSData *plainData = [encryptedData AES128DecryptWithKey:key];
    free(binChars);
    
    //转换为字符串
    NSString *plainString = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    
    return plainString;
}

-(NSString *)sha1ith64Base{
    unsigned char result[20];
    const char *cStr = [self UTF8String];
    CC_SHA1(cStr, (int)strlen(cStr), result);
    NSData *pwHashData = [[NSData alloc] initWithBytes:result length: sizeof result];
    NSString *str=[self dataToString:pwHashData];
    return  str;
}
-(NSString *) dataToString: (NSData *) _data{
    NSMutableString *pStr = [[NSMutableString alloc] initWithCapacity: 1];
    
    UInt8 *p = (UInt8*) [_data bytes];
    int len = (int)[_data length];
    
    for(int i = 0; i < len; i ++)
    {
        if(i%4==0){
            // [pStr appendFormat:@" "];
            [pStr appendFormat:@"%02x", *(p+i)];
        }else{
            [pStr appendFormat:@"%02x", *(p+i)];
        }
    }
    return pStr;
}

@end

