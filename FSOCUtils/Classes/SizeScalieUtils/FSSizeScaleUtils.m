//
//  FSSizeScaleUtils.m
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/9/10.
//

#import "FSSizeScaleUtils.h"
#import <UIKit/UIKit.h>

//static CGFloat const kIPadLeftBarW = 190.0;
//static CGFloat const kIPadRightBarW = 620.0;

#define kFSScreenSize             [[UIScreen mainScreen] bounds].size
#define kFSScreenWidth            [[UIScreen mainScreen] bounds].size.width
#define kFSScreenHeight           [[UIScreen mainScreen] bounds].size.height

#pragma mark - Private Methods

__unused static CGSize inchesSize5_8() {
    return CGSizeMake(375.0, 812.0);
}

__unused static CGSize inchesSize10_2() {
    return CGSizeMake(810.0, 1080.0);
}

static CGFloat autoSizeScaleIPhoneX() {
    return kFSScreenWidth / inchesSize5_8().width;
}

static CGFloat autoSizeScaleIPhoneY() {
    if (kFSScreenHeight <= inchesSize5_8().height) {
        return 1;
    }
    else {
        CGFloat scale = kFSScreenHeight / inchesSize5_8().height;
        if (scale > 1.2) {
            scale = 1.2;
        }
        return scale;
    }
}

//CGFloat static autoSizeIPadRightW() {
//    return kIPadRightBarW * kScreenWidth / inchesSize10_2().width;
//}

//CGFloat static autoSizeScaleIPadRightX() {
//    return autoSizeIPadRightW() / inchesSize5_8().width;
//}


static CGFloat autoSizeScaleX() {
//    if (IS_PAD) {
//        return autoSizeScaleIPadRightX();
//    }
//    else {
        return autoSizeScaleIPhoneX();
//    }
}

static CGFloat autoSizeScaleY() {
    return autoSizeScaleIPhoneY();
}

static CGFloat sizeScaleX(CGFloat value) {
    return value * autoSizeScaleX();
}

static CGFloat sizeScaleY(CGFloat value) {
    return value * autoSizeScaleY();
}

#pragma mark - Public Methods

CGFloat autoSizeScale() {
    return MIN(autoSizeScaleX(), autoSizeScaleY());
}

CGFloat sizeCeilScaleX(CGFloat value) {
    return ceil(sizeScaleX(value));
}

/** Y比例 * value 取整  */
CGFloat sizeCeilScaleY(CGFloat value) {
    return ceil(sizeScaleY(value));
}

/** Min(X/Y)比例 * value */
CGFloat sizeCeilScale(CGFloat value) {
    return ceil(value * autoSizeScale());
}

