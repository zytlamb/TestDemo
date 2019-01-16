//
//  MBProgressHUD+SFHUD.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/10/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "MBProgressHUD+SFHUD.h"

@implementation MBProgressHUD (SFHUD)
+ (MBProgressHUD*)showIndicatorToView:(UIView*)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    [MBProgressHUD hideIndicatorHUD:view];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setMode:MBProgressHUDModeIndeterminate];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;//可以点击其它位置
    //下面是白字黑色背景
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.0f];
    return hud;
}

+(void)showMessageAlaways:(NSString*)messgae
{
    [self hideHUD];
    UIView *view;
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = messgae;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_record_ripple"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    //下面是白字黑色背景
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
}

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    //下面是白字黑色背景
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:0.7];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    //    hud.dimBackground = YES;
    //下面是白字黑色背景
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    hud.backgroundView.style = NSPersonNameComponentsFormatterStyleLong;
    [hud hideAnimated:YES afterDelay:0.5];
    return hud;
}

+ (MBProgressHUD *)showMessage2:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    //    hud.dimBackground = YES;
    //下面是白字黑色背景
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    hud.backgroundView.style = NSPersonNameComponentsFormatterStyleLong;
    return hud;
}

//只显示文字
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr
{
    return [MBProgressHUD showOnlyText:showStr afterDelay:0];
}

//只显示文字
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr afterDelay:(CGFloat)afterDelay
{
    return [MBProgressHUD showOnlyText:showStr viewBottomDis:0 afterDelay:afterDelay toView:nil];
}

//提示框离时图底部的距离 distance
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance
{
    return [MBProgressHUD showOnlyText:showStr viewBottomDis:distance afterDelay:0 toView:nil];
}

+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance afterDelay:(CGFloat)afterDelay
{
    return [MBProgressHUD showOnlyText:showStr viewBottomDis:distance afterDelay:afterDelay toView:nil];
}

//提示框离时图底部的距离 distance
+ (MBProgressHUD*)showOnlyText:(NSString*)showStr viewBottomDis:(CGFloat)distance afterDelay:(CGFloat)afterDelay toView:(UIView*)view
{
    if(view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = showStr;
    hud.label.numberOfLines = 0;
    [hud setMode:MBProgressHUDModeText];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    if(distance!=0)
        hud.offset = CGPointMake(0, view.size.height/2.0 - distance);
    //下面是白字黑色背景
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    
    [hud hideAnimated:YES afterDelay:afterDelay==0?1.2:afterDelay];
    return hud;
}


+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)hideIndicatorHUD:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [self HUDForView:view];
    if (hud != nil && hud.mode == MBProgressHUDModeIndeterminate) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES];
    }
}
@end
