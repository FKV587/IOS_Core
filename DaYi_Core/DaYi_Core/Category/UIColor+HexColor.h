//
//  UIColor+HexColor.h
//  NewWiFiJD
//
//  Created by 付凯 on 15/7/31.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(HexColor)

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)a;

+ (UIColor *)colorWithHex:(long)hexColor;


@end
