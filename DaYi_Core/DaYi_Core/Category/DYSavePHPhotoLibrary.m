//
//  DYSavePHPhotoLibrary.m
//  DaYi_Defines
//
//  Created by Fukai on 2018/12/29.
//  Copyright © 2018 FuKai. All rights reserved.
//

#import "DYSavePHPhotoLibrary.h"
#import <Photos/Photos.h>

@implementation DYSavePHPhotoLibrary

+ (void)saveImage:(UIImage *)image{ 
    [self saveImage:image assetCollectionName:@"建融信帮"];
}

+ (void)saveImage:(UIImage *)image assetCollectionName:(NSString *)collectionName {
    // 1. 获取当前App的相册授权状态
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    // 2. 判断授权状态
    if (authorizationStatus == PHAuthorizationStatusAuthorized) {
        // 2.1 如果已经授权, 保存图片(调用步骤2的方法)
        [self saveImage:image toCollectionWithName:collectionName];
    } else if (authorizationStatus == PHAuthorizationStatusNotDetermined) {
        // 如果没决定, 弹出指示框, 让用户选择
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            // 如果用户选择授权, 则保存图片
            if (status == PHAuthorizationStatusAuthorized) {
                [self saveImage:image toCollectionWithName:collectionName];
            }
        }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [QMUITips showInfo:@"请在设置界面, 授权访问相册"];
        });
    }
}

+ (PHAssetCollection *)getCurrentPhotoCollectionWithTitle:(NSString *)collectionName {
    // 1. 创建搜索集合
    PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 2. 遍历搜索集合并取出对应的相册
    for (PHAssetCollection *assetCollection in result) {
        if ([assetCollection.localizedTitle containsString:collectionName]) {
            return assetCollection;
        }
    }
    return nil;
}

// 保存图片
+ (void)saveImage:(UIImage *)image toCollectionWithName:(NSString *)collectionName {
    // 1. 获取相片库对象
    PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
    // 2. 调用changeBlock
    [library performChanges:^{
        // 2.1 创建一个相册变动请求
        PHAssetCollectionChangeRequest *collectionRequest;
        // 2.2 取出指定名称的相册
        PHAssetCollection * assetCollection = [self getCurrentPhotoCollectionWithTitle:collectionName];
        // 2.3 判断相册是否存在
        if (assetCollection) { // 如果存在就使用当前的相册创建相册请求
            collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        } else { // 如果不存在, 就创建一个新的相册请求
            collectionRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:collectionName];
        }
        // 2.4 根据传入的相片, 创建相片变动请求
        PHAssetChangeRequest *assetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        // 2.4 创建一个占位对象
        PHObjectPlaceholder *placeholder = [assetRequest placeholderForCreatedAsset];
        // 2.5 将占位对象添加到相册请求中
        [collectionRequest addAssets:@[placeholder]];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        // 3. 判断是否出错, 如果报错, 声明保存不成功
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                [QMUITips showError:@"保存失败"];
            } else {
                [QMUITips showSucceed:@"保存成功"];
            }
        });
    }];
}

@end
