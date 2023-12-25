//
//  FSSizeScaleUtils.h
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/9/10.
//

#import <Foundation/Foundation.h>

/// Min(X/Y)比例
CGFloat autoSizeScale(void);

/** X比例 * value 取整  */
CGFloat sizeCeilScaleX(CGFloat value);

/** Y比例 * value 取整  */
CGFloat sizeCeilScaleY(CGFloat value);

/** Min(X/Y)比例 * value */
CGFloat sizeCeilScale(CGFloat value);
