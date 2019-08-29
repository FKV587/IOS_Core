//
//  UIColor+HexColor.m
//  NewWiFiJD
//
//  Created by 付凯 on 15/7/31.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor(HexColor)

+ (UIColor *)colorWithHex:(long)hexColor
{
    return [self colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)a
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:a];
}

@end
