//
//  UIButton+UIStyle.m
//  dayikeji
//
//  Created by Fukai on 2018/10/9.
//  Copyright © 2018年 李明. All rights reserved.
//

#import "UIButton+UIStyle.h"
#import <objc/runtime.h>

@implementation UIButton (UIStyle)

static char * UISTYLETYPE = "UISTYLETYPE";

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

- (void)bigButtonStyleOne
{
    [self roundCorner:4.0];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.3] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x1f96fa]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x298edc]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x1f96fa alpha:0.6]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)bigButtonStyleTwo
{
    [self roundCorner:4.0];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.3] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xF8F8F8]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xDFDFDF alpha:0.6]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xF8F8F8 alpha:0.3]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)inButtonStyleOne
{
    [self roundCorner:3.0];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.3] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x1f96fa]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x298edc]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x1f96fa alpha:0.6]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)inButtonStyleTwo
{
    [self roundCorner:3.0];
    [self setTitleColor:[UIColor colorWithHex:0x1f96fa alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:0.2] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xffffff]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x298edc]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xffffff alpha:0.2]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)inButtonStyleThree
{
    [self roundCorner:3.0];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.3] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xF8F8F8]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xDFDFDF]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xF8F8F8]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)inButtonStyleFour
{
    [self roundCorner:3.0];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.6] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.3] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xFFFFFF]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xDFDFDF]] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xFFFFFF]] forState:UIControlStateDisabled];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)inButtonStyleTagOne
{
    [self roundCorner:3.0];
    [self setTitleColor:[UIColor colorWithHex:0x353535 alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:1] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xf8f8f8]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0x00b7ee]] forState:UIControlStateSelected];
    self.contentEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9);
}

- (void)loadViews
{
    switch (self.uiStyle) {
        case UIButtonUIStyle_BIGONE:
            [self bigButtonStyleOne];
            break;
        case UIButtonUIStyle_BIGTWO:
            [self bigButtonStyleTwo];
            [self border:[UIColor colorWithHex:0xDDDDDD] width:1];
            break;
        case UIButtonUIStyle_ONE:
            [self inButtonStyleOne];
            break;
        case UIButtonUIStyle_TWO:
            [self inButtonStyleTwo];
            [self border:[UIColor colorWithHex:0x1f96fa] width:1];
            break;
        case UIButtonUIStyle_THREE:
            [self inButtonStyleThree];
            [self border:[UIColor colorWithHex:0xDDDDDD] width:1];
            break;
        case UIButtonUIStyle_FOUR:
            [self inButtonStyleFour];
            break;
        case UIButtonUIStyle_TAGONE:
            [self inButtonStyleTagOne];
            [self border:[UIColor colorWithHex:0xDDDDDD] width:0.5];
            break;
        default:
            break;
    }
}

- (void)setSelectedNew:(BOOL)selected{
    [self setSelectedNew:selected];
    if (selected) {
        switch (self.uiStyle) {
            case UIButtonUIStyle_TAGONE:
                [self border:[UIColor colorWithHex:0x00b7ee] width:1];
                break;
                
            default:
                break;
        }
    }else{
        switch (self.uiStyle) {
            case UIButtonUIStyle_TAGONE:
                [self border:[UIColor colorWithHex:0xDDDDDD] width:1];
                break;
                
            default:
                break;
        }
    }
}

- (void)setEnabledNew:(BOOL)enabled
{
    [self setEnabledNew:enabled];
    if (enabled) {
        switch (self.uiStyle) {
            case UIButtonUIStyle_TWO:
                [self border:[UIColor colorWithHex:0xDDDDDD] width:1];
                break;
                
            default:
                break;
        }
    }else{
        switch (self.uiStyle) {
            case UIButtonUIStyle_TWO:
                [self border:[UIColor colorWithHex:0x1f96fa] width:1];
                break;
                
            default:
                break;
        }
    }
}

- (void)buttonNormalColor:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor
{
    [self roundCorner:21.0];
    [self setTitleColor:[UIColor colorWithHex:0xffffff alpha:1] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:normalColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:highlightedColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage squareResizingModeStretchImageWithColor:[UIColor colorWithHex:0xDDDDDD]] forState:UIControlStateDisabled];
}

#pragma mark -- setter getter --
- (UIButtonUIStyle)uiStyle
{
    NSNumber * number = objc_getAssociatedObject(self, UISTYLETYPE);
    return number.integerValue;
}

- (void)setUiStyle:(UIButtonUIStyle)uiStyle
{
    objc_setAssociatedObject(self, UISTYLETYPE, @(uiStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self loadViews];
}


@end
