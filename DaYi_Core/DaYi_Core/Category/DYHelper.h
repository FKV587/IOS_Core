//
//  DYHelper.h
//  AFNetworking
//
//  Created by Fukai on 2019/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYHelper : NSObject

+ (instancetype _Nonnull)sharedInstance;

@end

@interface DYHelper (Bundle)

+ (nullable NSBundle *)resourcesBundle;
+ (nullable UIImage *)imageWithName:(nullable NSString *)name;

+ (nullable NSBundle *)resourcesBundleWithName:(nullable NSString *)bundleName;
+ (nullable UIImage *)imageInBundle:(nullable NSBundle *)bundle withName:(nullable NSString *)name;

@end

@interface DYHelper (QMUIAlert)

/**
 alert弹窗

 @param message message
 @param alertTure alert回调
 @param cancleAlert canlet回调
 */
+ (void)showAlertControllerMessage:(NSString *)message  alert:(DaYiBlock)alertTure cancle:(DaYiBlock)cancleAlert;

/**
 我知道了 laert弹窗

 @param alertTure alert回调
 */
+ (void)showSureAlertControllerMessage:(NSString *)message alert:(DaYiBlock)alertTure;

/**
 alert弹窗

 @param title title
 @param message message
 @param cancleTitle cancleTitle
 @param sureTitle sureTitle
 @param alertTure alert回调
 @param cancleAlert canlet回调
 */
+ (void)showAlertControllerTitle:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle alert:(DaYiBlock)alertTure cancle:(DaYiBlock)cancleAlert;

@end


@interface DYHelper (Phone)

/**
 直接拨打电话

 @param phone 电话号码
 */
+ (void)telpromptPhone:(NSString *)phone;

@end


/**
 正则
 */
@interface DYHelper (NSPredicate)

/**
 判断是否是手机号

 @param mobilePhone 手机号
 */
+ (BOOL)isALLMobilePhone:(NSString *)mobilePhone;

/**
 判断字符串是否全是数字

 @param text 字符串
 */
+ (BOOL)isALLNumber:(NSString *)text;

/**
 判断字符串是否全是英文

 @param text 字符串
 */
+ (BOOL)isALLEnglish:(NSString *)text;

@end


NS_ASSUME_NONNULL_END
