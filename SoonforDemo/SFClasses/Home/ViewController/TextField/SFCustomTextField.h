//
//  SFCustomTextField.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SFCustomTextFieldDelegate <NSObject>

@optional
- (BOOL)customTextFieldShouldBeginEditing:(UITextField *)textfield;

- (void)customTextFieldDidEndEditing:(UITextField *)textfield;

- (BOOL)customTextFieldShouldEndEditing:(UITextField *)textfield;

//输入框中叉号的点击
- (BOOL)customTextFieldShouldClear:(UITextField *)textfield;
//点击return
- (BOOL)customTextFieldShouldReturn:(UITextField *)textfield;
// 键盘删除按钮点击
- (void)customTextFieldDeleteBackward:(UITextField *)textField;
@end

@interface SFCustomTextField : UITextField
/**
 *  文字最大个数
 */
@property (nonatomic,assign) int max_char;

/**
 *  最多小数点位数
 */
@property (nonatomic,assign) int max_numberPoint;
/**
 *  输入框只能输入数字
 */
@property (nonatomic,assign) BOOL isMustNumber;

/**
 *  输入框只能输入数字和点
 */
@property (nonatomic,assign) BOOL isMustNumberOrPoint;

/**
 *  最多数量
 */
@property (nonatomic,assign) double max_number;

@property (nonatomic, weak) id<SFCustomTextFieldDelegate> textDelegate;

/**
 *  左边间隙
 */
- (void)textfieldHaveLeftSpacing:(BOOL)haveLeftSpacing withSpacing:(CGFloat)spacing;

/**
 *  左边带图片
 */
- (void)textfieldLetfImageName:(NSString *)imageName withWidth:(CGFloat)width;

/**
 *  左边带图片和文字
 */
- (void)textfieldLetfTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius withLeftWidth:(CGFloat)leftWidth;

- (void)textfieldLetfTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor withLeftWidth:(CGFloat)leftWidth;

/**
 *  右边带图片
 */
- (void)textfieldRightImageName:(NSString *)imageName withWidth:(CGFloat)width;

/**
 *  右边带图片和文字
 */
- (void)textfieldRightTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius withRightWidth:(CGFloat)rightWidth;

- (void)textfieldRightTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor withRightWidth:(CGFloat)rightWidth;

//- (void)textfieldRightTitle:(NSString *)title withImageName:(NSString *)imageName;
@end
