//
//  UILabel+SFLabel.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SFLabel)
/**
 创建UILabel，并且设置label的文字颜色，以及文字大小
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                       fontSize:(CGFloat)  fontSize;


/**
 创建UILabel,并且设置label的文字颜色，以及文字大小，以及背景色
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                       fontSize:(CGFloat)   fontSize
                        bgColor:(UIColor *) bgColor;


/**
 创建UILabel,并且设置label的文字大小，以及文字大小，以及背景色(如果不设置背景色，那么就设置为nil)，设置圆弧半径(如果设置大于0的值，将会圆角化)
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                       fontSize:(CGFloat)   fontSize
                        bgColor:(UIColor *) bgColor
                         radius:(CGFloat)   radius;


/**
 创建UILabel,并且设置label的文字大小，以及文字大小，以及背景色(如果不设置背景色，那么就设置为nil)，设置圆弧半径(如果不设置圆弧，那么设置为0即可)， 设置边框的颜色以及宽度
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                       fontSize:(CGFloat)   fontSize
                        bgColor:(UIColor *) bgColor
                         radius:(CGFloat)   radius
                    borderColor:(UIColor *) borderColor
                       borderWidth:(CGFloat)borderWidth;

//label 文字左上对齐
- (void)setTopAlignmentWithText:(NSString *)text
                      maxHeight:(CGFloat)maxHeight;
@end
