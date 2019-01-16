//
//  UILabel+SFLabel.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "UILabel+SFLabel.h"

@implementation UILabel (SFLabel)
/**
 创建UILabel，并且设置label的文字颜色，以及文字大小
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                          fontSize:(CGFloat)  fontSize{
    
    UILabel * label = [[UILabel alloc] init];
    if( textColor ){
        label.textColor = textColor;
    }
    label.font      = [SFFont font:fontSize];
    return label;
}


/**
 创建UILabel,并且设置label的文字颜色，以及文字大小，以及背景色
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                          fontSize:(CGFloat)   fontSize
                           bgColor:(UIColor *) bgColor {
    
    UILabel *label = [UILabel labelWithTextColor:textColor
                                         fontSize:fontSize];
    if ( bgColor ) {
        label.backgroundColor = bgColor;
    }
    return label;
}


/**
 创建UILabel,并且设置label的文字大小，以及文字大小，以及背景色(如果不设置背景色，那么就设置为nil)，设置圆弧半径(如果设置大于0的值，将会圆角化)
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                          fontSize:(CGFloat)   fontSize
                           bgColor:(UIColor *) bgColor
                            radius:(CGFloat)   radius{
    
    UILabel * label = [self labelWithTextColor:textColor
                                      fontSize:fontSize
                                       bgColor:bgColor];
    if ( radius > 0 ) {
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = radius;
    }
    return label;
}


/**
 创建UILabel,并且设置label的文字大小，以及文字大小，以及背景色(如果不设置背景色，那么就设置为nil)，设置圆弧半径(如果不设置圆弧，那么设置为0即可)， 设置边框的颜色以及宽度
 */
+ (UILabel *)labelWithTextColor:(UIColor *) textColor
                          fontSize:(CGFloat)   fontSize
                           bgColor:(UIColor *) bgColor
                            radius:(CGFloat)   radius
                       borderColor:(UIColor *) borderColor
                       borderWidth:(CGFloat)   borderWidth {
    
    UILabel * label = [self labelWithTextColor:textColor
                                      fontSize:fontSize
                                       bgColor:bgColor
                                        radius:radius];
    
    if ( borderColor && borderWidth > 0) {
        label.layer.borderWidth = borderWidth;
        label.layer.borderColor = borderColor.CGColor;
    }
    return label;
}

- (void)setTopAlignmentWithText:(NSString *)text maxHeight:(CGFloat)maxHeight
{
    CGRect frame = self.frame;
    CGSize size = [text sizeWithFont:self.font constrainedToSize:CGSizeMake(frame.size.width, maxHeight)];
    frame.size = CGSizeMake(frame.size.width, size.height);
    self.frame = frame;
    self.text = text;
}
@end
