//
//  NSString+DaYi.m
//  dayikeji
//
//  Created by Fukai on 2018/12/7.
//  Copyright © 2018年 李明. All rights reserved.
//

#import "NSString+DaYi.h"

@implementation NSString (DaYi)

+ (NSString *)isEmptyString:(id)str{
    if ([str isEqual:[NSNull null]]) {
        return @"";
    }else if ([str isKindOfClass:[NSNumber class]]){
        return [(NSNumber *)str stringValue];
    }
    return [(NSString *)str length] > 0 ? str : @"";
}


+ (NSString *)stringReloType:(ROLEIDTYPE)type{
    NSString * relo = @"";
    switch (type) {
        case ROLEIDTYPE_WORKER:
            relo = @"5pX68Rv2c7eU4MiSiZe";
            break;
        case ROLEIDTYPE_TEAMLEADER:
            relo = @"sUgIgRg59csISVYbByH";
            break;
        case ROLEIDTYPE_SERVICESCOMPANY:
            relo = @"x1Ba1qoEhfyP6S2qTvN";
            break;
        case ROLEIDTYPE_CONSTRUCTIONUNIT_TOTALPACKAGE:
            relo = @"7Va1tNd94LBrr0CKvc1";
            break;
        case ROLEIDTYPE_CONSTRUCTIONUNIT_DEVELOPER:
            relo = @"1HLcJSdvLFoUlld0voH";
            break;
        case ROLEIDTYPE_ADMINISTRATIVEUNIT:
            relo = @"QSjnnNzSgk2MnoemiQ4";
            break;

        default:
            break;
    }
    return relo;
}

+ (NSString *)humanReadableFileSize:(long long)size{
    if (size > 0.0 && size < 1024.0) {
        return [NSString stringWithFormat:@"%.2fB", size / 1.0f];
    }else if (size < 1024.0 * 1024.0){
        return [NSString stringWithFormat:@"%.2f KB",size / 1024.0];
    }else if (size < 1024.0 * 1024.0 * 1024.0){
        return [NSString stringWithFormat:@"%.2f MB",size / (1024.0 * 1024.0)];
    }else{
        return [NSString stringWithFormat:@"%.2f G",size / (1024.0 * 1024.0 * 1024.0)];
    }
    return @"0b";
}

+ (NSString *)cacheStringWithSDCache:(long long)cacheSize{
    if (cacheSize == 0) {
        return @"暂无缓存";
    }
    return [self humanReadableFileSize:cacheSize];
}

+ (CGSize)computationsTextTitlewith:(NSString *)title titleFont:(float)font widthSize:(float)width{
    CGSize titleSize = [[NSString stringWithFormat:@"%@",title] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return titleSize;
}

+ (NSString *)stringTimeYear:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyy"];
}

+ (NSString *)stringTimeMonth:(NSDate *)date{
    return [self stringTime:date dateFormat:@"M"];
}

+ (NSString *)stringTimeDay:(NSDate *)date{
    return [self stringTime:date dateFormat:@"d"];
}

+ (NSString *)stringTimeYYMMDD:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyyMMdd"];
}

+ (NSString *)stringTimeMMYDDR:(NSDate *)date{
    return [self stringTime:date dateFormat:@"M月d日"];
}

+ (NSString *)stringTimeYY_MM_DD:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyy-MM-dd"];
}

+ (NSString *)stringTimeYY_MM:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyy-MM"];
}

+ (NSString *)stringTimeDotYYMMDDHHmmss:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyy.MM.dd HH:mm:ss"];
}

+ (NSString *)stringTimeColonHHmmss:(NSDate *)date{
    return [self stringTime:date dateFormat:@"HH:mm:ss"];
}

+ (NSString *)stringTimeSlashYYMMDD:(NSDate *)date{
    return [self stringTime:date dateFormat:@"yyyy/MM/dd"];
}

+ (NSString *)stringTime:(NSDate *)date dateFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *curTime = [formatter stringFromDate:date];
    return curTime;
}

+ (NSDate *)dateTimeYY_MM_DD:(NSString *)time{
    return [self dateTimeString:time dateFormat:@"yyyy-MM-dd"];
}

+ (NSDate *)dateTimeYY_MM:(NSString *)time{
    return [self dateTimeString:time dateFormat:@"yyyy-MM"];
}

+ (NSDate *)dateTimeYYYYMMDDHHmmss:(NSString *)time{
    return [self dateTimeString:time dateFormat:@"YYYYMMDDHHmmss"];
}

+ (NSDate *)dateTimeYYYYMMDD:(NSString *)time{
    return [self dateTimeString:time dateFormat:@"yyyyMMdd"];
}

+ (NSDate *)dateTimeString:(NSString *)time dateFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate * curTimeDate = [formatter dateFromString:time];
    return curTimeDate;
}

- (NSString *)handleSpaceAndEnterElementWithString
{
    NSString *realSre = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *realSre1 = [realSre stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    NSString *realSre2 = [realSre1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return realSre2;
}

- (NSString *)stringWithrReloType:(ROLEIDTYPE)relo{
    switch (relo) {
        case ROLEIDTYPE_WORKER:
            return @"5pX68Rv2c7eU4MiSiZe";
            break;
        case ROLEIDTYPE_TEAMLEADER:
            return @"sUgIgRg59csISVYbByH";
            break;
        case ROLEIDTYPE_SERVICESCOMPANY:
            return @"x1Ba1qoEhfyP6S2qTvN";
            break;
        case ROLEIDTYPE_CONSTRUCTIONUNIT_TOTALPACKAGE:
            return @"7Va1tNd94LBrr0CKvc1";
            break;
        case ROLEIDTYPE_CONSTRUCTIONUNIT_DEVELOPER:
            return @"1HLcJSdvLFoUlld0voH";
            break;
        case ROLEIDTYPE_ADMINISTRATIVEUNIT:
            return @"QSjnnNzSgk2MnoemiQ4";
            break;

        default:
            break;
    }
    return @"";
}

@end
