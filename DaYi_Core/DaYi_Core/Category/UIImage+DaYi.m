//
//  UIImage+GennerateColor.m
//  dayikeji
//
//  Created by Fukai on 2018/10/9.
//  Copyright © 2018年 李明. All rights reserved.
//

#import "UIImage+DaYi.h"

#define max_width 2000
#define max_height 2000

@implementation UIImage (GennerateColor)

+ (UIImage *)squareImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, ceil(size.width), ceil(size.height)));
    UIImage * image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)squareResizingModeStretchImageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(3, 3);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, ceil(size.width), ceil(size.height)));
    UIImage * image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGFloat top = 1; // 顶端盖高度
    CGFloat bottom = 1 ; // 底端盖高度
    CGFloat left = 1; // 左端盖宽度
    CGFloat right = 1; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return image;
}

+ (UIImage *)underLineSquarImageWithBGColor:(UIColor *)color lineColor:(UIColor *)color1 andSize:(CGSize)size
{
    CIFilter *ciFilter = [CIFilter filterWithName:@"CILinearGradient"];
    CIVector *vector0 = [CIVector vectorWithX:0 Y:size.height];
    CIVector *vector1 = [CIVector vectorWithX:size.width Y:0];
    [ciFilter setValue:vector0 forKey:@"inputPoint0"];
    [ciFilter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor0"];
    [ciFilter setValue:vector1 forKey:@"inputPoint1"];
    [ciFilter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor1"];
    
    CIImage *ciImage = ciFilter.outputImage;
    CIContext *con = [CIContext contextWithOptions:nil];
    CGImageRef resultCGImage = [con createCGImage:ciImage
                                         fromRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resultUIImage = [UIImage imageWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    
    return resultUIImage;
}

+ (UIImage *)underLineSquarImageWithLeftColor:(UIColor *)color rightColor:(UIColor *)color1 andSize:(CGSize)size
{
    CIFilter *ciFilter = [CIFilter filterWithName:@"CILinearGradient"];
    CIVector *vector0 = [CIVector vectorWithX:0 Y:size.height];
    CIVector *vector1 = [CIVector vectorWithX:0 Y:size.width];
    [ciFilter setValue:vector0 forKey:@"inputPoint0"];
    [ciFilter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor0"];
    [ciFilter setValue:vector1 forKey:@"inputPoint1"];
    [ciFilter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor1"];
    
    CIImage *ciImage = ciFilter.outputImage;
    CIContext *con = [CIContext contextWithOptions:nil];
    CGImageRef resultCGImage = [con createCGImage:ciImage
                                         fromRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resultUIImage = [UIImage imageWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    
    return resultUIImage;
}

+ (UIImage *)underLineSquarImageWithLeftUpColor:(UIColor *)color rightDownColor:(UIColor *)color1 andSize:(CGSize)size
{
    CIFilter *ciFilter = [CIFilter filterWithName:@"CILinearGradient"];
    CIVector *vector0 = [CIVector vectorWithX:0 Y:size.height];
    CIVector *vector1 = [CIVector vectorWithX:size.width Y:0];
    [ciFilter setValue:vector0 forKey:@"inputPoint0"];
    [ciFilter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor0"];
    [ciFilter setValue:vector1 forKey:@"inputPoint1"];
    [ciFilter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor1"];
    
    CIImage *ciImage = ciFilter.outputImage;
    CIContext *con = [CIContext contextWithOptions:nil];
    CGImageRef resultCGImage = [con createCGImage:ciImage
                                         fromRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resultUIImage = [UIImage imageWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    
    return resultUIImage;
}

+ (UIImage *)shadow_normal_image
{
    CGFloat top = 6; // 顶端盖高度
    CGFloat bottom = 10 ; // 底端盖高度
    CGFloat left = 6; // 左端盖宽度
    CGFloat right = 5; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    return [[UIImage imageNamed:@"btn.9"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)navigationBarBackgroundImageWithThemeColor:(UIColor *)color {
    CGSize size = CGSizeMake(4, 88);
    color = color ? color : UIColorClear;
    
    UIImage *resultImage = [UIImage qmui_imageWithSize:size opaque:YES scale:0 actions:^(CGContextRef contextRef) {
        CGColorSpaceRef spaceRef = CGColorSpaceCreateDeviceRGB();
//        CGGradientRef gradient = CGGradientCreateWithColors(spaceRef, (CFArrayRef)@[(id)color.CGColor, (id)[color qmui_colorWithAlphaAddedToWhite:.86].CGColor], NULL);
        CGGradientRef gradient = CGGradientCreateWithColors(spaceRef, (CFArrayRef)@[(id)color.CGColor, (id)color.CGColor], NULL);
        CGContextDrawLinearGradient(contextRef, gradient, CGPointZero, CGPointMake(0, size.height), kCGGradientDrawsBeforeStartLocation);
        CGColorSpaceRelease(spaceRef);
        CGGradientRelease(gradient);
    }];
    return [resultImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1) resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)scaleImage:(UIImage *)aImage{
    if(aImage.size.width > max_width || aImage.size.height > max_height)
    {
        float scale = 1.0f;
        float newwidth = max_width;
        float newheight = max_height;
        if(aImage.size.width > aImage.size.height)
        {
            newwidth = max_width;
            scale = aImage.size.width / newwidth;
            newheight = aImage.size.height / scale;
        }
        else if(aImage.size.width == aImage.size.height)
        {
            scale = 1.0f;
            newwidth = max_width;
            newheight = max_height;
        }
        else
        {
            newheight = max_height;
            scale = aImage.size.height / newheight;
            newwidth = aImage.size.width / scale;
        }
        
        
        CGSize newSize = CGSizeMake(newwidth, newheight);
        UIGraphicsBeginImageContext(newSize);
        [aImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    }
    else
    {
        return aImage;
    }
    return aImage;
}

+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end

@implementation UIImage (DYHelper)

+ (UIImage *)imageWithName:(NSString *)name {
    return [DYHelper imageWithName:name];
}

@end
