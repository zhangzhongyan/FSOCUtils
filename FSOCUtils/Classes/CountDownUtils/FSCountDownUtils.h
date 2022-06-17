//
//  FSCountDownUtils.h
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/11/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSCountDownUtils : NSObject

/** 单例 */
@property (class, nonatomic, strong, readonly) FSCountDownUtils *share;

/// 倒计时变更Block
@property (nonatomic, copy, nullable) void (^countDownChangeBlock) (NSUInteger countDown);

/// 当前倒计时
@property (nonatomic, assign) NSUInteger currentCountDown;

/// 开始倒计时
- (void)startCountDownWithCount:(NSUInteger)count;

/// 停止倒计时
- (void)stopCountDown;

@end

NS_ASSUME_NONNULL_END
