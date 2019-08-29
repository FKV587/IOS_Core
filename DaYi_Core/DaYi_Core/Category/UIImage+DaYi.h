//
//  UIImage+GennerateColor.h
//  dayikeji
//
//  Created by Fukai on 2018/10/9.
//  Copyright © 2018年 李明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GennerateColor)
+ (UIImage *)squareImageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (UIImage *)squareResizingModeStretchImageWithColor:(UIColor *)color;

//渐变色从上到下
+ (UIImage *)underLineSquarImageWithBGColor:(UIColor *)color lineColor:(UIColor *)color1 andSize:(CGSize)size;
//渐变色从左上到右下
+ (UIImage *)underLineSquarImageWithLeftUpColor:(UIColor *)color rightDownColor:(UIColor *)color1 andSize:(CGSize)size;
//渐变色从左到右
+ (UIImage *)underLineSquarImageWithLeftColor:(UIColor *)color rightColor:(UIColor *)color1 andSize:(CGSize)size;

+ (UIImage *)shadow_normal_image;
//navigationBarBackgroundImage
+ (UIImage *)navigationBarBackgroundImageWithThemeColor:(UIColor *)color;

/**
 压缩图片
*/
+ (UIImage *)scaleImage:(UIImage *)aImage;

/**
 图片旋转
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;
@end

@interface UIImage (DYHelper)

/**
 获取本地图片

 @param name 图片名称
 @return image
 */
+ (UIImage *)imageWithName:(NSString *)name;

@end
