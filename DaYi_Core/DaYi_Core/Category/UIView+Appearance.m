//
//  UIView+Appearance.m
//  AutoGang
//
//  Created by luoxu on 14/11/12.
//  Copyright (c) 2014年 com.qcb008.QiCheApp. All rights reserved.
//

#import "UIView+Appearance.h"
#import "UIColor+HexColor.h"

@implementation UIView(Appearance)

- (void)roundBorder
{
    [self roundCorner:5.0];
    [self border:UIColorSeparator width:0.5];
}

- (void)roundCorner:(CGFloat)raduis
{
    self.layer.cornerRadius = raduis;
    self.layer.masksToBounds = YES;
}

- (void)border:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
}

- (void)topBorder:(UIColor *)color width:(CGFloat)width
{
  CALayer * topBorder = [CALayer new];
  topBorder.frame = CGRectMake(0, 0, self.frame.size.width, width);
  topBorder.backgroundColor = color.CGColor;
  [self.layer addSublayer:topBorder];
}

- (void)bottomBorder:(UIColor *)color width:(CGFloat)width
{
  CALayer * topBorder = [CALayer new];
  topBorder.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
  topBorder.backgroundColor = color.CGColor;
  [self.layer addSublayer:topBorder];
}

- (void)leftBorder:(UIColor *)color width:(CGFloat)width
{
  CALayer * topBorder = [CALayer new];
  topBorder.frame = CGRectMake(0, 0, width, self.frame.size.height);
  topBorder.backgroundColor = color.CGColor;
  [self.layer addSublayer:topBorder];
}

- (void)rightBorder:(UIColor *)color width:(CGFloat)width
{
  CALayer * topBorder = [CALayer new];
  topBorder.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
  topBorder.backgroundColor = color.CGColor;
  [self.layer addSublayer:topBorder];
}

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius
{
    [self hadowViewShadowOpacity:shadowOpacity radius:radius borderColor:UIColorWhite shadowColor:UIColorGrayLighten];
}

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius color:(UIColor *)color
{
    [self hadowViewShadowOpacity:shadowOpacity radius:radius borderColor:color shadowColor:color];
}

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor
{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowOffset = CGSizeMake(2,5);
}

- (void)hadowViewShadowOpacity:(CGFloat)shadowOpacity radius:(CGFloat)radius shadowColor:(UIColor *)shadowColor  shadowOffset:(CGSize)shadowOffset{
    self.layer.cornerRadius = radius;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
}

- (void)hadowViewShadowOpacity:(float)shadowOpacity layerColor:(UIColor *)color  shadowOffset:(CGSize)shadowOffset{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
}

- (void)viewBorderLineStrokeViewBorderColor:(UIColor *)borderColor viewFrame:(CGRect)frame{
    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = borderColor.CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:frame].CGPath;
    border.frame = frame;//view.bounds;
    // 不要设太大 不然看不出效果
    border.lineWidth = 1;
    border.lineCap = @"square";
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@3, @2];
    [self.layer addSublayer:border];
}

- (void)showShakeAnimation{
    // 获取到当前的View
    CALayer *viewLayer = self.layer;
    // 获取当前View的位置
    CGPoint position = viewLayer.position;
    // 移动的两个终点位置
    CGPoint x = CGPointMake(position.x + 10, position.y);
    CGPoint y = CGPointMake(position.x - 10, position.y);
    // 设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    // 设置运动形式
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    // 设置开始位置
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    // 设置结束位置
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    // 设置自动反转
    [animation setAutoreverses:YES];
    // 设置时间
    [animation setDuration:.06];
    // 设置次数
    [animation setRepeatCount:3];
    // 添加上动画
    [viewLayer addAnimation:animation forKey:nil];
}

@end
