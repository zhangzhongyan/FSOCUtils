//
//  FSDeviceUtils.h
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/9/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** 设备判断 */
#define kFS_IS_IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define kFS_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define kFS_ScreenSize             [[UIScreen mainScreen] bounds].size
#define kFS_ScreenWidth            [[UIScreen mainScreen] bounds].size.width
#define kFS_ScreenHeight           [[UIScreen mainScreen] bounds].size.height

#define kFS_APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kFS_APP_BUNDLE_ID  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define kFS_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]

/** 状态栏 */
#define kFS_STATUS_BAR_H  UIApplication.sharedApplication.statusBarFrame.size.height
/** 状态栏 + 导航栏  */
#define KFS_TAB_BAR_H  (FSDeviceUtils.safeAreaInsetsBottom > 0 ? 83 : 49)

@interface FSDeviceUtils : NSObject

///// 设备ID
//+ (NSString *)deviceUUID;

/// iOS 3
+ (NSNumber *)getDeviceType;

/// 设备类型
+ (NSString *)getPhoneType;

/** 是否是刘海屏幕 */
+ (BOOL)isBangs;

/// 底部安全区域
+ (CGFloat)safeAreaInsetsBottom;

@end

NS_ASSUME_NONNULL_END
