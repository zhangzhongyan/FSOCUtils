//
//  FSDESEncrypUtils.h
//  FSOCUtils
//
//  Created by 张忠燕 on 2023/2/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSDESEncrypUtils : NSObject

+ (nullable NSString *)encryptWithString:(nullable NSString *)content key:(nullable NSString *)key;

+ (nullable NSString *)decryptWithString:(nullable NSString *)content key:(nullable NSString *)key;

@end

NS_ASSUME_NONNULL_END
