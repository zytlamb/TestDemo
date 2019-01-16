//
//  UIButton+SFCustomButton.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "UIButton+SFCustomButton.h"

@implementation UIButton (SFCustomButton)

/**
 生成button，且设置normal状态下的标题，前景色，背景色，圆角
 */
+ ( UIButton * ) buttonWithTitle:(NSString *) title
                      titleColor:(UIColor *)  textColor
                         bgColor:(UIColor *)  bgColor
                          radius:(CGFloat)    radius {
    UIButton * btn = [UIButton buttonWithType:0];
    if ( title ) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if ( textColor ) {
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    }
    
    if ( bgColor ) {
        btn.backgroundColor = bgColor;
    }
    
    if ( radius > 0 ) {
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius  = radius;
    }
    
    return btn;
}



/**
 生成button，且设置normal状态下的标题，前景色，背景色，圆角，以及边框
 */
+ ( UIButton * ) buttonWithTitle:(NSString *) title
                      titleColor:(UIColor *)  textColor
                         bgColor:(UIColor *)  bgColor
                          radius:(CGFloat)    radius
                     borderWidth:(CGFloat)    borderWidth
                     borderColor:(UIColor *)  borderColor {
    
    UIButton * btn = [self buttonWithTitle:title
                                titleColor:textColor
                                   bgColor:bgColor
                                    radius:radius];
    if ( borderColor && borderWidth > 0 ) {
        btn.layer.borderWidth = borderWidth;
        btn.layer.borderColor = borderColor.CGColor;
    }
    return btn;
}



/**
 生成button，且设置normal状态下药显示的图片
 */
+ ( UIButton * ) buttonWithImageName:(NSString *) imageName {
    
    UIButton * btn = [UIButton buttonWithType:0];
    if ( imageName ) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return btn;
}

- ( UIButton * ) setButtonWithTitle:(NSString *) title
                         titleColor:(UIColor *)  textColor
                            bgColor:(UIColor *)  bgColor
                             radius:(CGFloat)    radius
                        borderWidth:(CGFloat)    borderWidth
                        borderColor:(UIColor *)  borderColor {
    
    if ( title ) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    
    if ( textColor ) {
        [self setTitleColor:textColor forState:UIControlStateNormal];
    }
    
    if ( bgColor ) {
        self.backgroundColor = bgColor;
    }
    
    if ( radius > 0 ) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius  = radius;
    }
    
    if ( borderColor && borderWidth > 0 ) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
    }
    return self;
}


- (void)layoutButtonWithEdgeInsetsStyle:(SFButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space {
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    
    switch (style) {
        case SFButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case SFButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case SFButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case SFButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
