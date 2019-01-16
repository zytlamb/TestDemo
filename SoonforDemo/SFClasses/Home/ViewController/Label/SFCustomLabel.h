//
//  SFCustomLabel.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFCustomLabel : UILabel
@property(nonatomic, assign) UIEdgeInsets edgeInsets;

//给UILabel设置行间距和字间距
- (void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font withLineSpacing:(CGFloat)lineSpacing withFontSpacing:(CGFloat)fontSpacing;

//计算UILabel的高度(带有行间距的情况)
- (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;

@end
