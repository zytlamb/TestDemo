//
//  UIButton+SFCustomButton.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, SFButtonEdgeInsetsStyle) {
    SFButtonEdgeInsetsStyleTop, // image在上，label在下
    SFButtonEdgeInsetsStyleLeft, // image在左，label在右
    SFButtonEdgeInsetsStyleBottom, // image在下，label在上
    SFButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (SFCustomButton)
/**
 生成button，且设置normal状态下的标题，前景色，背景色，圆角
 */
+ ( UIButton * ) buttonWithTitle:(NSString *) title
                      titleColor:(UIColor *)  textColor
                         bgColor:(UIColor *)  bgColor
                          radius:(CGFloat)    radius;

/**
 生成button，且设置normal状态下的标题，前景色，背景色，圆角，以及边框
 */
+ ( UIButton * ) buttonWithTitle:(NSString *) title
                      titleColor:(UIColor *)  textColor
                         bgColor:(UIColor *)  bgColor
                          radius:(CGFloat)    radius
                     borderWidth:(CGFloat)    borderWidth
                     borderColor:(UIColor *)  borderColor;


/**
 生成button，且设置normal状态下药显示的图片
 */
+ ( UIButton * ) buttonWithImageName:(NSString *) imageName;


- ( UIButton * ) setButtonWithTitle:(NSString *) title
                         titleColor:(UIColor *)  textColor
                            bgColor:(UIColor *)  bgColor
                             radius:(CGFloat)    radius
                        borderWidth:(CGFloat)    borderWidth
                        borderColor:(UIColor *)  borderColor;


/**
*  设置button的titleLabel和imageView的布局样式，及间距
*
*  @param style titleLabel和imageView的布局样式
*  @param space titleLabel和imageView的间距
*/
- (void)layoutButtonWithEdgeInsetsStyle:(SFButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
