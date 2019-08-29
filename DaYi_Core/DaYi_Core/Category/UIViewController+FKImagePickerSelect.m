//
//  UIViewController+FKImagePickerSelect.m
//  DaYi_Defines
//
//  Created by Fukai on 2018/12/29.
//  Copyright © 2018 FuKai. All rights reserved.
//

#import "UIViewController+FKImagePickerSelect.h"

@implementation UIViewController (FKImagePickerSelect)

- (void)showImageAlertViewImage{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    UIAlertAction *imagePicker = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];

    [alert addAction:photo];
    [alert addAction:imagePicker];
    [alert addAction:cancle];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)type{
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = type;
    controller.allowsEditing = YES;
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark -- UINavigationControllerDelegate,UIImagePickerControllerDelegate --

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *tempImage = [UIImage fixOrientation:info[UIImagePickerControllerOriginalImage]];
    tempImage = [UIImage scaleImage:tempImage];
    if ([self respondsToSelector:@selector(getImagePickerSelectImage:)]) {
        [self getImagePickerSelectImage:tempImage];
    }
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark -- UIViewControllerFKImagePickerSelectDelegate --

- (void)getImagePickerSelectImage:(UIImage *)image{
    NSLog(@"UIViewControllerFKImagePickerSelectDelegate -- %@",image);
}


@end
