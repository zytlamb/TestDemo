//
//  MBProgressHUD+SFHUD.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/10/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (SFHUD)
+ (MBProgressHUD*)showIndicatorToView:(UIView*)view;
+ (void)hideIndicatorHUD:(UIView *)view;

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

+ (MBProgressHUD *)showMessage2:(NSString *)message toView:(UIView *)view;

+(void)showMessageAlaways:(NSString*)messgae;
/*
 默认现实1.2秒
 */
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr;

+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance;

+ (MBProgressHUD*)showOnlyText:(NSString*)showStr afterDelay:(CGFloat)afterDelay;

+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance afterDelay:(CGFloat)afterDelay;

/*
 可设置提示框离屏幕底部的距离
 */
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance afterDelay:(CGFloat)afterDelay toView:(UIView*)view;
@end
