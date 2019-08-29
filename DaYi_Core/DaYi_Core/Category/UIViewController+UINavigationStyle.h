//
//  UIViewController+UINavigationStyle.h
//  DaYi_Defines
//
//  Created by Fukai on 2018/12/26.
//  Copyright © 2018 FuKai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QMUIKit/QMUINavigationController.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (UINavigationStyle)<QMUINavigationControllerDelegate>

- (CGFloat)tabBarHeight;

@end

NS_ASSUME_NONNULL_END
