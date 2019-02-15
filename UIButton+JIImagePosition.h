//
//  UIButton+JIImagePosition.h
//  按钮图片位置调整
//
//  Created by Yang on 2019/2/13.
//  Copyright © 2019年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JIImagePositionStyleDefault,//默认样式(图片在左，文字在右)
     JIImagePositionStyleTop,//图片在上,文字在下
    JIImagePositionStyleBottom,//图片在下，文字在上
    JIImagePositionStyleRight,//图片在右，文字在左
} JIImagePositionStyle;

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JIImagePosition)

/**
 设置图文样式

 @param imagePositionStyle 图文样式
 @param spacing             图文间距
 */
- (void)JI_imagePositionStyle:(JIImagePositionStyle)imagePositionStyle
                   andSpacing:(CGFloat)spacing;

/**
 *  设置图片与文字样式（推荐使用）
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)JI_imagePositionStyle:(JIImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *btn))imagePositionBlock;
@end

NS_ASSUME_NONNULL_END
