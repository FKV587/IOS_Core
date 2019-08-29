
#import <Foundation/Foundation.h>

#define ApplicationWindow [UIApplication sharedApplication].keyWindow
//自己的版本号
#define VersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#ifndef weakify
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#endif

#ifndef strongify
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#endif

/*
 ------------------------app内发通知---------------
 */
//上一级刷新数据
typedef void(^ __nullable DYRefesh)(void);
typedef void(^ __nullable DaYiBlock)(void);
typedef void(^ __nullable DaYiBOOLBlock)(BOOL status);
typedef void(^ __nullable DaYiBlock1)(id _Nullable data);

#define UIFontMediumMake(size) [UIFont systemFontOfSize:size weight:UIFontWeightMedium]
#define UIFontSemiboldMake(size) [UIFont systemFontOfSize:size weight:UIFontWeightSemibold]

#define DYACCOUNTMAXLENGTH 11
#define MaxPickerSelectedImageCount 6
#define DYMargin UIEdgeInsetsMake(10, 15, 10, 15)
#define DYLoginLeftMargin 20.0
#define DYTableViewSectionHeight 10.0

#define DYMaxSearchTextLength 20
#define DYMaxSearchProjectTextLength 10
#define DYDEFAULTSMALLCELLHEIGHT 50.0


//SafeAreaInsetsConstantForDeviceWithNotch.bottom
/*
 -----------------------颜色-----------------------
 */

#define UIColorOrange               [UIColor colorWithHex:0xff8601]
#define UIColorOrangeLighten        [UIColor colorWithHex:0xf9b010]
#define UIColorBlueDarken           [UIColor colorWithHex:0x4782e9]
#define UIColorBlueLighten          [UIColor colorWithHex:0x2e9ef5]
#define UIColorBlackDarken          [UIColor colorWithHex:0x34393f]
#define UIColorRedDarken            [UIColor colorWithHex:0xff3b30]

/*
 -----------------------默认图片-----------------------
 */

#define DYDEFAULTIMAGE [UIImage imageWithName:@"default_noimg"]
#define DYDEFAULTAVATARIMAGE [UIImage imageWithName:@"default_avatar"]
#define DYDEFAULTCELLARROWIMAGE [UIImage imageWithName:@"icon-all-arrow"]

/*
 -----------------------默认数据-----------------------
 */

#define myDotNumbers @"0123456789.\n"
#define myNumbers @"0123456789\n"
#define DYIPAChannel @"APPSTORE"
#define JPUSHAPPKEY @"2bbfca18924af1ed8c010571"//极光推送的key
#define JPUSHAPPUSERID @"notfionJpushid"//通知发送绑定别名
#define JPUSHDELETEUSERID @"deletenotfiinjpushid"//清楚绑定的别名

#define BAIDUMAPKEY @"uREAf649bOzkRl24uzuk94GLzSrlbe2c"//百度地图

#define INLETTYPE @"C"

#define NETWORKDEFULTERROR @"网络请求失败,请稍后再试"
#define ALLPROJECTSTATISTICS @"所有项目统计"
#define DYSMSSERVICETOAST @"短信已发送至您的手机，请注意查收"

#define SUCCESS @"DaYi_success"
#define FAIL @"DaYi_fail"
#define AUTHORIZATION @"DaYi_authorization"
#define DYREFRESHWORKBENCH @"DYREFRESHWORKBENCH"

//菜单code
#define DYM00000 @"M00000"//更多功能
#define DYM10001 @"M10001"//扫一扫
#define DYM10002 @"M10002"//合同管理
#define DYM10003 @"M10003"//任务计划
#define DYM10004 @"M10004"//质量巡检
#define DYM10005 @"M10005"//安全巡检
#define DYM10006 @"M10006"//产值
#define DYM10007 @"M10007"//纠纷处理
#define DYM10008 @"M10008"//三级教育
#define DYM10009 @"M10009"//考勤
#define DYM10010 @"M10010"//实名制
#define DYM10011 @"M10011"//视频监控
#define DYM10012 @"M10012"//智能硬件
#define DYM10013 @"M10013"//环境监测
#define DYM10014 @"M10014"//招工
#define DYM10015 @"M10015"//待处理的
#define DYM10016 @"M10016"//我发起的
//权限code
#define DYHTCJ4JyY8658 @"4JyY8658"//合同 - 创建按钮
#define DY906Q079K @"906Q079K"//任务计划 - 我负责的
#define DYx1f5110y @"x1f5110y"//任务计划 - 待审批的
#define DY908a75z5 @"908a75z5"//任务计划 - 历史记录模块
#define DYoI7A2f74 @"oI7A2f74"//任务计划 - 我创建的
#define DY8q9tgk3u @"8q9tgk3u"//任务计划 - 创建按钮
#define DY1g9u43c3 @"1g9u43c3"//质量巡检 - 待审批的
#define DY3d05X0DK @"3d05X0DK"//质量巡检 - 历史记录模块
#define DYQPX6eijq @"QPX6eijq"//质量巡检 - 我负责的
#define DY6Dg9FE9H @"6Dg9FE9H"//质量巡检 - 我创建的
#define DY47G2r9Mt @"47G2r9Mt"//质量巡检 - 创建按钮
#define DY543r19Gz @"543r19Gz"//安全巡检 - 待审批的
#define DY4CPr9s49 @"4CPr9s49"//安全巡检 - 历史记录模块
#define DY6830tfKw @"6830tfKw"//安全巡检 - 我负责的
#define DYeCL300Q8 @"eCL300Q8"//安全巡检 - 创建按钮
#define DYv0613Y3r @"v0613Y3r"//安全巡检 - 我创建的
#define DY5u3qH0yO @"5u3qH0yO"//纠纷处理 - 待处理的
#define DY5IL549w8 @"5IL549w8"//纠纷处理 - 历史记录模块
#define DY2Ei3tT2o @"2Ei3tT2o"//纠纷处理 - 我创建的
#define DY6uI2g46e @"6uI2g46e"//纠纷处理 - 创建按钮
#define DY73JOe1R6 @"73JOe1R6"//实名管理 - 不良记录
#define DYBc7g9330 @"Bc7g9330"//实名管理 - 花名册
#define DYJ2d9d3Q9 @"J2d9d3Q9"//实名管理 - 添加不良记录
#define DYf820XsK6 @"f820XsK6"//实名管理 - 添加工人
#define DYZLYJGGZT1RWJ @"GGZT1RWJ"//智能硬件 - 添加智能硬件
#define DYZLYJ9KB846zE @"9KB846zE"//智能硬件 - 扫码
#define DYZLYJ5T169N4e @"5T169N4e"//智能硬件 - 删除智能硬件

typedef enum : int {
    ROLEIDTYPE_WORKER = 1,   //工人
    ROLEIDTYPE_TEAMLEADER,   //班组长
    ROLEIDTYPE_SERVICESCOMPANY,   //劳务公司
    ROLEIDTYPE_CONSTRUCTIONUNIT_TOTALPACKAGE,   //施工单位-总包
    ROLEIDTYPE_CONSTRUCTIONUNIT_DEVELOPER,   //建设单位-开发商
    ROLEIDTYPE_ADMINISTRATIVEUNIT,   //行政单位
} ROLEIDTYPE;


typedef enum : int {
    DYTASKDETAILTYPE_MYPLAN = 1,//待审批的
    DYTASKDETAILTYPE_DOING,//我负责的
    DYTASKDETAILTYPE_MYCREAT,//我创建的
    DYTASKDETAILTYPE_HISTORY,//巡检记录 历史计划
    DYTASKDETAILTYPE_RECT,//我整改的
    DYTASKDETAILTYPE_LOOKLOOK,//只能看不能操作
    DYTASKDETAILTYPE_ALREADY,//已处理
} DYTASKDETAILTYPE;

typedef enum : int {
    DYPLATFORMDETAILTYPE_QUALITY = 1,//质量
    DYPLATFORMDETAILTYPE_SECTITY,//安全
    DYPLATFORMDETAILTYPE_BUSINESS,//商务认证
    DYPLATFORMDETAILTYPE_TASK,//任务
    DYPLATFORMDETAILTYPE_CONTRACT,//合同
    DYPLATFORMDETAILTYPE_BADRECORD,//实名管理
    DYPLATFORMDETAILTYPE_VIDEO,//视频监控
    DYPLATFORMDETAILTYPE_EDUCATION,//三级教育
    DYPLATFORMDETAILTYPE_DISPUTES,//纠纷
    DYPLATFORMDETAILTYPE_SIGN,//考勤
    DYPLATFORMDETAILTYPE_ADDRESSBOOK,//通讯录
    DYPLATFORMDETAILTYPE_ZHAOGONG,//招工
} DYPLATFORMDETAILTYPE;

// 箭头的位置
typedef enum : int {
    AddressBookFoldingSectionHeaderArrowPositionLeft,
    AddressBookFoldingSectionHeaderArrowPositionRight,
} AddressBookFoldingSectionHeaderArrowPosition;

typedef enum : int {
    ViewControllerNavigationBarType_Normal,
    ViewControllerNavigationBarType_Search,
} ViewControllerNavigationBarType;
