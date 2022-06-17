//
//  FSAESEncrypUtils.m
//  Fargo
//
//  Created by 张忠燕 on 2022/6/17.
//  Copyright © 2022 geekthings. All rights reserved.
//

#import "FSAESEncrypUtils.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation FSAESEncrypUtils

#pragma mark - Public Methods

+ (nullable NSString *)encryptWithString:(nullable NSString *)content key:(nullable NSString *)key
{
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrptedData = [FSAESEncrypUtils aesWithData:contentData keyData:keyData operation:kCCEncrypt];
    return [encrptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (nullable NSString *)decryptWithString:(nullable NSString *)content key:(nullable NSString *)key
{
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptedData = [FSAESEncrypUtils aesWithData:contentData keyData:keyData operation:kCCDecrypt];
    if (decryptedData) {
        return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

#pragma mark - Private Methods

+ (nullable NSData *)aesWithData:(NSData *)contentData keyData:(NSData *)keyData operation:(CCOperation)operation
{
    if (!contentData.length || !keyData.length) {
        return nil;
    }
    
    NSString *hint = [NSString stringWithFormat:@"The key size of AES-%d should be %d bytes!", kCCKeySizeAES256 * 8, kCCKeySizeAES256];
    NSCAssert(keyData.length == kCCKeySizeAES256, hint);
    
    NSUInteger dataLength = contentData.length;
    
    NSString *kInitVector = @"A-16-Byte-String";
    void const *initVectorBytes = [kInitVector dataUsingEncoding:NSUTF8StringEncoding].bytes;
    void const *contentBytes = contentData.bytes;
    void const *keyBytes = keyData.bytes;
    
    size_t operationSize = dataLength + kCCBlockSizeAES128;
    void *operationBytes = malloc(operationSize);
    if (operationBytes == NULL) {
        return nil;
    }
    size_t actualOutSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          keyBytes,
                                          kCCKeySizeAES256,
                                          initVectorBytes,
                                          contentBytes,
                                          dataLength,
                                          operationBytes,
                                          operationSize,
                                          &actualOutSize);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:operationBytes length:actualOutSize];
    }
    free(operationBytes);
    operationBytes = NULL;
    return nil;
}

@end
