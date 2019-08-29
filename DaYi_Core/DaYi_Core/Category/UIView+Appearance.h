//
//  UIView+Appearance.h
//  AutoGang
//
//  Created by luoxu on 14/11/12.
//  Copyright (c) 2014年 com.qcb008.QiCheApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Appearance)

- (void)roundBorder;

- (void)roundCorner:(CGFloat)raduis;

- (void)border:(UIColor *)color width:(CGFloat)width;

- (void)topBorder:(UIColor *)color width:(CGFloat)width;

- (void)bottomBorder:(UIColor *)color width:(CGFloat)width;

- (void)leftBorder:(UIColor *)color width:(CGFloat)width;

- (void)rightBorder:(UIColor *)color width:(CGFloat)width;

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius;

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius color:(UIColor *)color;

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor;

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius shadowColor:(UIColor *)shadowColor  shadowOffset:(CGSize)shadowOffset;

- (void)hadowViewShadowOpacity:(float)shadowOpacity layerColor:(UIColor *)color  shadowOffset:(CGSize)shadowOffset;

- (void)viewBorderLineStrokeViewBorderColor:(UIColor *)borderColor viewFrame:(CGRect)frame;
//抖动动画
- (void)showShakeAnimation;

@end
