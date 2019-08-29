//
//  NSMutableAttributedString+DY.m
//  dayikeji
//
//  Created by Fukai on 2018/10/19.
//  Copyright © 2018年 李明. All rights reserved.
//

#import "NSMutableAttributedString+DY.h"

@implementation NSMutableAttributedString (DY)

+ (NSMutableAttributedString *)attributedSetting:(NSString *)firstStr waitStr:(NSString *)waitStr font:(UIFont *)font
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:waitStr];
    [attString addAttribute:NSForegroundColorAttributeName
                      value:UIColorSeparator
                      range:NSMakeRange(4, 1)];
    [attString addAttribute:NSForegroundColorAttributeName
                      value:UIColorBlue
                      range:NSMakeRange(5, firstStr.length)];
    [attString addAttribute:NSFontAttributeName
                      value:font
                      range:NSMakeRange(5, firstStr.length)];
    [attString addAttribute:NSForegroundColorAttributeName
                      value:UIColorSeparator
                      range:NSMakeRange(5 + firstStr.length, 1)];
    return attString;
}

+ (NSMutableAttributedString *)setLabelAttributedStringContent:(NSString *)content Font:(UIFont *)font textColor:(UIColor *)color range:(NSRange)range{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:content];
    if (range.location != NSNotFound) {
        [attString addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
        
        [attString addAttribute:NSFontAttributeName
                          value:font
                          range:range];
        return attString;
    }else{
        return attString;
    }
}

+ (NSMutableAttributedString *)setLabelAttributedStringContent:(NSString *)content Fonts:(NSArray <UIFont *>*)fonts textColor:(NSArray <UIColor *>*)colors ranges:(NSArray <NSString *>*)subStings{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:content];
    [subStings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [content rangeOfString:obj];
        UIColor * color = colors[idx];
        UIFont * font = fonts[idx];
        if (range.location != NSNotFound) {
            [attString addAttribute:NSForegroundColorAttributeName
                              value:color
                              range:range];
            [attString addAttribute:NSFontAttributeName
                              value:font
                              range:range];
        }
    }];
    return attString;
}

+ (NSMutableAttributedString *)setLabelAttributedText:(NSString *)text ranges:(NSArray *)ranges{
    return [self setLabelAttributedStringContent:text Fonts:@[[UIFont systemFontOfSize:14.0],[UIFont systemFontOfSize:17.0]] textColor:@[UIColorBlack,UIColorBlackDarken] ranges:ranges];
}
@end
