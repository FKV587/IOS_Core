//
//  NSString+FolatLastValue.m
//  dayikeji
//
//  Created by Fukai on 2018/11/8.
//  Copyright © 2018年 李明. All rights reserved.
//

#import "NSString+FolatLastValue.h"

@implementation NSString (FolatLastValue)

+ (NSString *)stringDisposeWithFloat:(float)floatValue
{
    NSString *str = [NSString stringWithFormat:@"%.1f",floatValue];
    long len = str.length;
    for (int i = 0; i < len; i++)
    {
        if (![str  hasSuffix:@"0"])
            break;
        else
            str = [str substringToIndex:[str length]-1];
    }
    if ([str hasSuffix:@"."])//避免像2.0000这样的被解析成2.
    {
        //s.substring(0, len - i - 1);
        return [str substringToIndex:[str length]-1];
    }
    else
    {
        return str;
    }
}

- (NSString *)notRounding:(float)price{
   return [self notRounding:price afterPoint:1];
}

/**
 四舍五入 保留position小数
 */
- (NSString *)notRounding:(float)price afterPoint:(int)position{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

@end
