//
//  UIViewController+FKImagePickerSelect.h
//  DaYi_Defines
//
//  Created by Fukai on 2018/12/29.
//  Copyright © 2018 FuKai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewControllerFKImagePickerSelectDelegate <NSObject>

/**
 实现该方法返回ImagePicker选中的图片

 @param image 压缩旋转后的图片
 */
- (void)getImagePickerSelectImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FKImagePickerSelect)<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIViewControllerFKImagePickerSelectDelegate>

/**
 弹窗选择
 */
- (void)showImageAlertViewImage;

/**
 直接选择

 @param type 类型
 */
- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)type;

@end

NS_ASSUME_NONNULL_END
