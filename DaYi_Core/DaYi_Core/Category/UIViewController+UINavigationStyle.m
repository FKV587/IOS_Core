//
//  UIViewController+UINavigationStyle.m
//  DaYi_Defines
//
//  Created by Fukai on 2018/12/26.
//  Copyright © 2018 FuKai. All rights reserved.
//

#import "UIViewController+UINavigationStyle.h"

@implementation UIViewController (UINavigationStyle)

- (CGFloat)tabBarHeight{
    return self.tabBarController.tabBar.hidden || self.hidesBottomBarWhenPushed ? SafeAreaInsetsConstantForDeviceWithNotch.bottom : TabBarHeight;
}

#pragma makr -- QMUINavigationControllerDelegate --

- (BOOL)preferredNavigationBarHidden{
    return NO;
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}

- (BOOL)forceEnableInteractivePopGestureRecognizer{
    return YES;
}

/*
+ (void)load
{
    [self method_replaceMethod:@selector(setEnabled:) swizMethod:@selector(setEnabledNew:)];
    [self method_replaceMethod:@selector(setSelected:) swizMethod:@selector(setSelectedNew:)];
}

+ (void)method_replaceMethod:(SEL)origSEL swizMethod:(SEL)swizSEL
{
    Method origMethod = class_getInstanceMethod(self, origSEL);
    Method swizMethod = class_getInstanceMethod(self, swizSEL);
    BOOL didAddMethod = class_addMethod(self, origSEL, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(self, swizSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, swizMethod);
    }
}
*/


@end
