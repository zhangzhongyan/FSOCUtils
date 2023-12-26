//
//  FSDeviceUtils.m
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/9/14.
//

#import "FSDeviceUtils.h"
//Helper
//#import "FCUUID.h"
#import "sys/utsname.h"

@implementation FSDeviceUtils

//+ (NSString *)deviceUUID
//{
//    return [FCUUID uuidForDevice];
//}

+ (NSNumber *)getDeviceType {
    return @(3);
}

+ (NSString *)getPhoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceModel;
}

+ (BOOL)isBangs {
    // 根据安全区域判断
    if (@available(iOS 11.0, *)) {
        CGFloat height = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        return (height > 0);
    }
    else {
        return NO;
    }
}

+ (CGFloat)safeAreaInsetsBottom {
    // 根据安全区域判断
    if (@available(iOS 11.0, *)) {
        CGFloat height = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
        return height;
    }
    else {
        return 0;
    }
}

@end
