//
//  UIButton+UIStyle.h
//  dayikeji
//
//  Created by Fukai on 2018/10/9.
//  Copyright © 2018年 李明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UIButtonUIStyle_BIGONE = 1,
    UIButtonUIStyle_BIGTWO,
    UIButtonUIStyle_ONE,
    UIButtonUIStyle_TWO,
    UIButtonUIStyle_THREE,
    UIButtonUIStyle_FOUR,
    UIButtonUIStyle_TAGONE,
} UIButtonUIStyle;

@interface UIButton (UIStyle)

@property (nonatomic , assign)UIButtonUIStyle uiStyle;
- (void)buttonNormalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor;

@end
