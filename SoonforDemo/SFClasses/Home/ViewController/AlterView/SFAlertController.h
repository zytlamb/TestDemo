//
//  SFAlertController.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/11.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SFAlertViewStyle) {
    
    
    SFAlertViewAlert = 0,//中间弹框
    
    SFAlertViewSheet,//底部弹框
    
};

typedef void (^clickBlock)(NSInteger itemIndex);

typedef void (^textFieldClickBlock)(NSInteger itemIndex, UITextField *textField);

@interface SFAlertController : UIView
/*
 调用的时候回调实在闭包里面,请注意避免循环引用
 */
/**
 弹框封装
 @param title 标题
 @param message 信息
 @param cancelTitle 取消按钮文字
 @param actionsArr 按钮数组
 @param style 弹框类型(中间或者是底部)
 @param itemBlock 回调
 */

+ (void)AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle acitons:(NSArray *)actionsArr style:(SFAlertViewStyle)style inView:(UIView*)toView itemblock:(clickBlock)itemBlock;

/*
 调用的时候回调实在闭包里面,请注意避免循环引用
 */
/**
 弹框封装
 @param title 标题
 @param message 信息
 @param cancelTitle 取消按钮文字
 @param actionsArr 按钮数组
 @param style 弹框类型(中间或者是底部)
 @param textFieldClickBlock 回调
 */
+ (void)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle acitons:(NSArray *)actionsArr style:(SFAlertViewStyle)style inView:(UIView*)toView textFieldClickBlock:(textFieldClickBlock)textFieldClickBlock;
@end
