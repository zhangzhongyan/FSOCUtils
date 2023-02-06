//
//  FSDESEncrypUtils.m
//  FSOCUtils
//
//  Created by 张忠燕 on 2023/2/6.
//

#import "FSDESEncrypUtils.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation FSDESEncrypUtils

#pragma mark - Public Methods

+ (nullable NSString *)encryptWithString:(nullable NSString *)content key:(nullable NSString *)key
{
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrptedData = [FSDESEncrypUtils desWithData:contentData keyData:keyData operation:kCCEncrypt];
    return [encrptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (nullable NSString *)decryptWithString:(nullable NSString *)content key:(nullable NSString *)key
{
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptedData = [FSDESEncrypUtils desWithData:contentData keyData:keyData operation:kCCDecrypt];
    if (decryptedData) {
        return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

#pragma mark - Private Methods

+ (nullable NSData *)desWithData:(NSData *)contentData keyData:(NSData *)keyData operation:(CCOperation)operation
{
    if (!contentData.length || !keyData.length) {
        return nil;
    }
    
    NSString *hint = [NSString stringWithFormat:@"The key size of 3DES-%d should be %d bytes!", kCCKeySize3DES * 8, kCCKeySize3DES];
    NSCAssert(keyData.length == kCCKeySize3DES, hint);
    
    NSUInteger dataLength = contentData.length;
    
    NSString *kInitVector = @"A-16-Byte-String";
    void const *initVectorBytes = [kInitVector dataUsingEncoding:NSUTF8StringEncoding].bytes;
    void const *contentBytes = contentData.bytes;
    void const *keyBytes = keyData.bytes;
    
    size_t operationSize = dataLength + kCCBlockSize3DES;
    void *operationBytes = malloc(operationSize);
    if (operationBytes == NULL) {
        return nil;
    }
    size_t actualOutSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithm3DES,
                                          kCCOptionPKCS7Padding,
                                          keyBytes,
                                          kCCKeySize3DES,
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
