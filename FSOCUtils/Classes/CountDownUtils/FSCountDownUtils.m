//
//  FSCountDownUtils.m
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/11/9.
//

#import "FSCountDownUtils.h"

@interface FSCountDownUtils ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation FSCountDownUtils

#pragma mark - Initialize Methods

+ (FSCountDownUtils *)share
{
    static FSCountDownUtils *timerShared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timerShared = [[FSCountDownUtils alloc] init];
    });
    return timerShared;
}

#pragma mark - Private Methods

- (void)stopCountDown {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
    }
    self.timer = nil;
}

#pragma mark - Public Methods

- (void)startCountDownWithCount:(NSUInteger)count {
    
    self.currentCountDown = count;
    [self stopCountDown];

    if (self.countDownChangeBlock) {
        self.countDownChangeBlock(self.currentCountDown);
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0f * NSEC_PER_SEC, 0.0f * NSEC_PER_SEC);
    
    __weak __typeof__(self) weakSelf = self;
    dispatch_source_set_event_handler(self.timer, ^{
        __strong __typeof__(self) self = weakSelf;
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong __typeof__(self) self = weakSelf;
            
            self.currentCountDown--;
            if (self.currentCountDown <= 0){ //倒计时结束，关闭
                [self stopCountDown];
            }

            if (self.countDownChangeBlock) {
                self.countDownChangeBlock(self.currentCountDown);
            }
        });
    });
    
    dispatch_resume(self.timer);
}

- (void)resetCountDown
{
    self.currentCountDown = 0;
    [self stopCountDown];
    
    if (self.countDownChangeBlock) {
        self.countDownChangeBlock(0);
    }
}

@end
