//
//  SFHeader.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/8.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#ifndef SFHeader_h
#define SFHeader_h

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//第三方
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "IQKeyboardManager.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "Masonry.h"
#import "WMPageController.h"
#import "TZImagePickerController.h"

//分类
#import "UIColor+SFExpanded.h"
#import "UILabel+SFLabel.h"
#import "UITextView+SFPlaceholder.h"
#import "UIButton+SFCustomButton.h"
#import "UIView+SFFrame.h"
#import "UIView+SFCommonLine.h"
#import "MBProgressHUD+SFHUD.h"

//自定义的tool
#import "SFBaseViewController.h"
#import "SFNavigationViewController.h"
#import "SFFont.h"
#import "SFAlertController.h"


#define SFSCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SFSCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define SFSCREENSIZE [[UIScreen mainScreen] bounds].size

// 判断是否是iPhone X
#define SFDevice_Is_iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 导航栏高度
#define SFNavbar_Height (SFDevice_Is_iPhoneX ? 88 : 64)
// 状态栏高度
#define SFStatus_Height [[UIApplication sharedApplication] statusBarFrame].size.height
// tabBar高度
#define SFTabbar_Height (SFDevice_Is_iPhoneX ? 83 : 49)
// 安全高度
#define SafeAreaBottomHeight (SFDevice_Is_iPhoneX  ? 34 : 0)
//判断是否是ipad
#define SFIsIpad ([[UIDevice currentDevice].model isEqualToString:@"iPad"])
//根据机型按比例分配
#define SFScaleFrom_iPhone6_Desgin(_X_) (_X_ * (SFSCREENWIDTH/(SFIsIpad?768:375)))


#define SFRGBA_Color(R,G,B,A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define SFRGB_Color(R,G,B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
#define SFHexColor(str) [UIColor colorWithHexString:str]
#define SFRedColor [UIColor colorWithHexString:@"eb433a"]
#define SFWhiteColor [UIColor colorWithHexString:@"ffffff"]
#define SFTextColor3 [UIColor colorWithHexString:@"333333"]
#define SFTextColor8 [UIColor colorWithHexString:@"888888"]
#define SFColor_d7 [UIColor colorWithHexString:@"d7d7d7"]
#define SFColor_f9 [UIColor colorWithHexString:@"f9f9f9"]
#define SFColor_ed [UIColor colorWithHexString:@"ededed"]
#define SFColor_f0 [UIColor colorWithHexString:@"f0f0f0"]
#define SFblueColor [UIColor colorWithHexString:@"0599fd"]

//字符串是否相等
#define SFStringEqual(str1,str2) [str1 isEqualToString:str2]
//字符串是否为空
#define SFStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define SFArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define SFDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define SFObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//把nil的转为@""，主要避免字典赋值奔溃
#define ISNil(str) ([str isKindOfClass:[NSNull class]] || str == nil ? @"" : str)

//解决强引用
#define WeakSelf(type)  __weak typeof(type) weak##type = type

//默认没有图片占位符N
#define No_picture [UIImage imageNamed:@"no_picture"]

//优化NSLog

#ifdef DEBUG

#define NSLog(format,...) printf("%s\n",[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])

#else

#define NSLog(...)

#endif

#define APPDELEGATE (AppDelegate*)[UIApplication sharedApplication].delegate

#pragma mark- 保存键值对到应用
#define UD_GET_OBJ(KEY) [[NSUserDefaults standardUserDefaults] objectForKey:(KEY)]
#define UD_SET_OBJ(OBJ,KEY)  [[NSUserDefaults standardUserDefaults] setObject:(OBJ) forKey:(KEY)]; [[NSUserDefaults standardUserDefaults] synchronize]

#define UUID  @"UUID"
#define SERVER_URL  @"SERVER_URL"//服务器
#define FILE_SERVER_URL  @"FILE_SERVER_URL"//文件服务器

//GCD
#define GLOBAL(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


#endif /* SFHeader_h */
