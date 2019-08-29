//
//  DYHelper.m
//  AFNetworking
//
//  Created by Fukai on 2019/8/15.
//

#import "DYHelper.h"

NSString *const DYResourcesMainBundleName = @"DaYiResources.bundle";

@implementation DYHelper (Bundle)

+ (NSBundle *)resourcesBundle {
    return [DYHelper resourcesBundleWithName:DYResourcesMainBundleName];
}

+ (NSBundle *)resourcesBundleWithName:(NSString *)bundleName {
    NSBundle *bundle = [NSBundle bundleWithPath: [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:bundleName]];
    if (!bundle) {
        // 动态framework的bundle资源是打包在framework里面的，所以无法通过mainBundle拿到资源，只能通过其他方法来获取bundle资源。
        NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
        NSDictionary *bundleData = [self parseBundleName:bundleName];
        if (bundleData) {
            bundle = [NSBundle bundleWithPath:[frameworkBundle pathForResource:[bundleData objectForKey:@"name"] ofType:[bundleData objectForKey:@"type"]]];
        }
    }
    return bundle;
}

+ (UIImage *)imageWithName:(NSString *)name {
    NSBundle *bundle = [DYHelper resourcesBundle];
    return [QMUIHelper imageInBundle:bundle withName:name];
}

+ (UIImage *)imageInBundle:(NSBundle *)bundle withName:(NSString *)name {
    if (bundle && name) {
        if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
            return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
        } else {
            NSString *imagePath = [[bundle resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
            return [UIImage imageWithContentsOfFile:imagePath];
        }
    }
    return nil;
}

+ (NSDictionary *)parseBundleName:(NSString *)bundleName {
    NSArray *bundleData = [bundleName componentsSeparatedByString:@"."];
    if (bundleData.count == 2) {
        return @{@"name":bundleData[0], @"type":bundleData[1]};
    }
    return nil;
}

@end

@implementation DYHelper (QMUIAlert)

+ (void)showAlertControllerMessage:(NSString *)message  alert:(DaYiBlock)alertTure cancle:(DaYiBlock)cancleAlert{
    [self showAlertControllerTitle:@"温馨提示" message:message cancleTitle:@"取消" sureTitle:@"确定" alert:alertTure cancle:cancleAlert];
}

+ (void)showSureAlertControllerMessage:(NSString *)message alert:(DaYiBlock)alertTure{
    [self showAlertControllerTitle:@"温馨提示" message:message cancleTitle:@"" sureTitle:@"知道了" alert:alertTure cancle:nil];
}

+ (void)showAlertControllerTitle:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle alert:(DaYiBlock)alertTure cancle:(DaYiBlock)cancleAlert{
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:title message:message preferredStyle:QMUIAlertControllerStyleAlert];
    
    if (cancleTitle.length > 0) {
        [alertController addAction:[QMUIAlertAction actionWithTitle:cancleTitle style:QMUIAlertActionStyleCancel handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
            if (cancleAlert) {
                cancleAlert();
            }
        }]];
    }
    
    if (sureTitle.length > 0) {
        [alertController addAction:[QMUIAlertAction actionWithTitle:sureTitle style:QMUIAlertActionStyleDefault handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
            if (alertTure) {
                alertTure();
            }
        }]];
    }
    [alertController showWithAnimated:YES];
}

@end

@implementation DYHelper (Phone)

+ (void)telpromptPhone:(NSString *)phone{
    if (phone.length == 0) {
        [QMUITips showError:@"暂无电话"];
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableString *phoneStr = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
    });
}

@end

@implementation DYHelper (NSPredicate)

+ (BOOL)isALLMobilePhone:(NSString *)mobilePhone{
    NSString *regex = @"[0-9]{11}$";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:mobilePhone];
    return result;
}

+ (BOOL)isALLNumber:(NSString *)text{
    NSString *regex = @"^[0-9]*$";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:text];
    return result;
}

+ (BOOL)isALLEnglish:(NSString *)text{
    NSString *regex = @"^[a-z]|[A-Z]*$";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:text];
    return result;
}

@end


@implementation DYHelper

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [DYHelper sharedInstance];// 确保内部的变量、notification 都正确配置
    });
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static DYHelper *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
        // 先设置默认值，不然可能变量的指针地址错误
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (void)dealloc {
    // QMUIHelper 若干个分类里有用到消息监听，所以在 dealloc 的时候注销一下
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
