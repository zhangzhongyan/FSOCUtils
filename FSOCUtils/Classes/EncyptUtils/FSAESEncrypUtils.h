//
//  FSAESEncrypUtils.h
//  Fargo
//
//  Created by 张忠燕 on 2022/6/17.
//  Copyright © 2022 geekthings. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSAESEncrypUtils : NSObject

+ (nullable NSString *)encryptWithString:(nullable NSString *)content key:(nullable NSString *)key;

+ (nullable NSString *)decryptWithString:(nullable NSString *)content key:(nullable NSString *)key;

@end

NS_ASSUME_NONNULL_END
