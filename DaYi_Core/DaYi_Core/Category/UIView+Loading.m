//
//  UIView+Loading.m
//  DaYi_Defines
//
//  Created by Fukai on 2018/10/30.
//  Copyright © 2018年 FuKai. All rights reserved.
//

#import "UIView+Loading.h"

@implementation UIView (Loading)

- (void)showDaYiLoading{
    [self showDaYiLoadingTitle:nil subtitle:nil];
}

- (void)showDaYiLoadingTitle:(NSString *)title{
    [self showDaYiLoadingTitle:title subtitle:nil];
}

- (void)showDaYiLoadingSubtitle:(NSString *)subtitle{
    [self showDaYiLoadingTitle:nil subtitle:subtitle];
}

- (void)showDaYiLoadingTitle:(NSString *)title subtitle:(NSString *)subtitle{
    [self hiddenLoding];
    [QMUITips showLoading:title detailText:subtitle inView:self];
}

- (void)hiddenLoding{
    [QMUITips hideAllTipsInView:self];
}

- (void)showToast:(NSString *)message{
    [QMUITips showWithText:message];
}

- (void)showSuccessdToast:(NSString *)message{
    [self showSucceed:message detailText:nil hideAfterDelay:0];
}

- (void)showErrorToast:(NSString *)message{
    [self showError:message detailText:nil hideAfterDelay:0];
}

- (void)showNetErrorToast:(NSString *)message{
    [self showNetError:message detailText:nil hideAfterDelay:0];
}

- (void)showSucceed:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    [self showTipWithImageView:[[UIImageView alloc] initWithImage:[[QMUIHelper imageWithName:@"QMUI_tips_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]] text:text detailText:detailText hideAfterDelay:delay];
}

- (void)showError:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    [self showTipWithImageView:[[UIImageView alloc] initWithImage:[[QMUIHelper imageWithName:@"QMUI_tips_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]] text:text detailText:detailText hideAfterDelay:delay];
}

- (void)showNetError:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay {
    [self showTipWithImageView:[[UIImageView alloc] initWithImage:[[QMUIHelper imageWithName:@"QMUI_tips_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]] text:text detailText:detailText hideAfterDelay:delay];
}

- (void)showTipWithImageView:(UIImageView *)customView text:(NSString *)text detailText:(NSString *)detailText hideAfterDelay:(NSTimeInterval)delay{
    QMUITips *tips = [[QMUITips alloc] initWithView:self];
    [self addSubview:tips];
    tips.removeFromSuperViewWhenHide = YES;
    QMUIToastContentView *contentView = [[QMUIToastContentView alloc] init];
    contentView.customView = customView;
    contentView.textLabelText = text ?: @"";
    contentView.detailTextLabelText = detailText ?: @"";
    tips.contentView = contentView;
    
    [tips showAnimated:YES];
    
    [tips hideAnimated:YES afterDelay:[QMUITips smartDelaySecondsForTipsText:text]];
}

@end
