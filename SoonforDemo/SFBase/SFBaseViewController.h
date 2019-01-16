//
//  SFBaseViewController.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapBlock)(void);

typedef enum SFNaviBarStyle {
    SFNaviBarStyleBorder,
    SFNaviBarStyleNormal
} SFNaviBarStyle;

@interface SFBaseViewController : UIViewController


- (void)addNaviBarAttributedTextTitle:(NSString *)title;

/**
 @param title 文字标题
 @param buttonStyle button风格
 @param image 图片
 @param tapBlock 点击事件
 @return 导航左边的按钮
 */
- (UIButton *)addLeftNaviBarTitle:(NSString *)title buttonStyle:(SFNaviBarStyle)buttonStyle image:(UIImage *)image tapBlock:(tapBlock)tapBlock;

/**
 @param title 文字标题
 @param buttonStyle button风格
 @param image 图片
 @param tapBlock 点击事件
 @return 导航右边的按钮
 */
- (UIButton *)addRightNaviBarTitle:(NSString *)title buttonStyle:(SFNaviBarStyle)buttonStyle image:(UIImage *)image tapBlock:(tapBlock)tapBlock;

/**
 @param oneTitle 左边的按钮文字
 @param twoTitle 右边的按钮文字
 @param oneImage 左边的按钮图片
 @param twoImage 右边的按钮图片
 @param oneStyle 风格
 @param twoStyle 风格
 @param tapBlock 左边点击事件
 @param twoBlock 右边点击事件
 @return 导航右边两个按钮
 */
- (UIButton *)addLeftNaviBarOneTitle:(NSString *)oneTitle twoTitle:(NSString *)twoTitle OneImage:(UIImage *)oneImage twoImage:(UIImage *)twoImage oneStyle:(SFNaviBarStyle)oneStyle twoStyle:(SFNaviBarStyle)twoStyle tapBlock:(tapBlock)tapBlock twoBlock:(tapBlock)twoBlock;

/**
 @param oneTitle 左边的按钮文字
 @param twoTitle 右边的按钮文字
 @param oneImage 左边的按钮图片
 @param twoImage 右边的按钮图片
 @param oneStyle 风格
 @param twoStyle 风格
 @param tapBlock 左边点击事件
 @param twoBlock 右边点击事件
 @return 导航右边两个按钮
 */
- (UIButton *)addRightNaviBarOneTitle:(NSString *)oneTitle twoTitle:(NSString *)twoTitle OneImage:(UIImage *)oneImage twoImage:(UIImage *)twoImage oneStyle:(SFNaviBarStyle)oneStyle twoStyle:(SFNaviBarStyle)twoStyle tapBlock:(tapBlock)tapBlock twoBlock:(tapBlock)twoBlock;


@end
