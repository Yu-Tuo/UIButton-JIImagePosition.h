//
//  UIButton+JIImagePosition.m
//  按钮图片位置调整
//
//  Created by Yang on 2019/2/13.
//  Copyright © 2019年 Yang. All rights reserved.
//

#import "UIButton+JIImagePosition.h"

@implementation UIButton (JIImagePosition)

- (void)JI_imagePositionStyle:(JIImagePositionStyle)imagePositionStyle
                   andSpacing:(CGFloat)spacing
{
    //为什么self.contentHorizontalAlignment为靠左或靠右的时候，只设置左或右的偏移？
    //因为遵循原意，居中的话就设置左右各偏移一半，即使只设置左或右，效果一样。(目前是这样理解的)
    if (imagePositionStyle == JIImagePositionStyleDefault) {
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft){
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        }
        else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight){
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        }
        else{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -0.5 * spacing, 0, 0.5 * spacing);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, -0.5 * spacing);
        }
    }
    if (imagePositionStyle == JIImagePositionStyleRight) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat titleW = self.titleLabel.frame.size.width;
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+spacing, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW, 0, 0);
        }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - titleW);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageW + spacing);
        }else{
            CGFloat imageOffset = self.titleLabel.frame.size.width+0.5*spacing;
            CGFloat titleOffset = self.imageView.frame.size.width+0.5*spacing;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset, 0, -imageOffset);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -titleOffset, 0, titleOffset);
        }
    }
    if (imagePositionStyle == JIImagePositionStyleTop) {
        
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        NSLog(@"\nimageW = %f\nimageH = %f\nimageIntriW = %f\nimageIntriH = %f\ntitleIntrinsicW = %f\ntitileintrinsicH = %f\ntitleW = %f\ntitleH = %f",imageW,imageH,self.imageView.intrinsicContentSize.width,self.imageView.intrinsicContentSize.height,titleIntrinsicContentSizeW,titleIntrinsicContentSizeH,self.titleLabel.frame.size.width,self.titleLabel.frame.size.height);
        self.imageEdgeInsets = UIEdgeInsetsMake(- titleIntrinsicContentSizeH - spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, - imageH - spacing, 0);

    } else if (imagePositionStyle == JIImagePositionStyleBottom) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(titleIntrinsicContentSizeH + spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, imageH + spacing, 0);
    }
    
}

/**
 *  设置图片与文字样式（推荐使用）
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)JI_imagePositionStyle:(JIImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *btn))imagePositionBlock {
    
    imagePositionBlock(self);
    
    if (imagePositionStyle == JIImagePositionStyleDefault) {
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        } else {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - 0.5 * spacing, 0, 0.5 * spacing);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, - 0.5 * spacing);
        }
    } else if (imagePositionStyle == JIImagePositionStyleRight) {
        CGFloat imageW = self.imageView.image.size.width;
        CGFloat titleW = self.titleLabel.frame.size.width;
        if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + spacing, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, 0, 0);
        } else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - titleW);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, imageW + spacing);
        } else {
            CGFloat imageOffset = titleW + 0.5 * spacing;
            CGFloat titleOffset = imageW + 0.5 * spacing;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset, 0, - imageOffset);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - titleOffset, 0, titleOffset);
        }
    } else if (imagePositionStyle == JIImagePositionStyleTop) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(- titleIntrinsicContentSizeH - spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, - imageH - spacing, 0);
    } else if (imagePositionStyle == JIImagePositionStyleBottom) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(titleIntrinsicContentSizeH + spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, imageH + spacing, 0);
    }
}

@end
