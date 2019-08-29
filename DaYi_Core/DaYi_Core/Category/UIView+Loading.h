//
//  UIView+Loading.h
//  DaYi_Defines
//
//  Created by Fukai on 2018/10/30.
//  Copyright © 2018年 FuKai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Loading)

- (void)showDaYiLoading;
- (void)showDaYiLoadingTitle:(NSString *)title;
- (void)showDaYiLoadingSubtitle:(NSString *)subtitle;
- (void)showDaYiLoadingTitle:(NSString *)title subtitle:(NSString *)subtitle;
- (void)hiddenLoding;

- (void)showToast:(NSString *)message;
- (void)showNetErrorToast:(NSString *)message;
- (void)showErrorToast:(NSString *)message;
- (void)showSuccessdToast:(NSString *)message;

@end
