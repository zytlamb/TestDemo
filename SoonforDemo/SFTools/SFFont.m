//
//  SFFont.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFFont.h"

#define SFFont_SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
static CGFloat fontScale;
@implementation SFFont
+ (void)load {
    fontScale = SFFont_SCREEN_WIDTH/(SFIsIpad ? 768 : 375);//适配屏幕
    fontScale = (NSInteger)(fontScale * 100)/100.0;
}


+ (UIFont *)boldFont:(double) fontSize {
    return [UIFont boldSystemFontOfSize:(NSInteger)(fontSize * fontScale)];
}


+ (UIFont *)font:( double ) fontSize {
    return [UIFont systemFontOfSize:(NSInteger)(fontSize * fontScale)];
}

#pragma mark
#pragma mark
#pragma mark -- normal font
+ (UIFont *)font11 {
    return [self font:11];
}
+ (UIFont *)font12 {
    return [self font:12];
}

+ (UIFont *)font13 {
    return [self font:13];
}

+ (UIFont *)font14 {
    return [self font:14];
}

+ (UIFont *)font15 {
    return [self font:15];
}

+ (UIFont *)font16 {
    return [self font:16];
}

+ (UIFont *)font17 {
    return [self font:17];
}

+ (UIFont *)font18 {
    return [self font:18];
}

+ (UIFont *)font19 {
    return [self font:19];
}

+ (UIFont *)font20 {
    return [self font:20];
}

+ (UIFont *)font21 {
    return [self font:21];
}

+ (UIFont *)font22 {
    return [self font:22];
}

+ (UIFont *)font23 {
    return [self font:23];
}


+ (UIFont *)font24 {
    return [self font:24];
}


#pragma mark
#pragma mark
#pragma mark --weight font
+ (UIFont *)boldFont11 {
    return [self boldFont:11];
}
+ (UIFont *) boldFont12 {
    return [self boldFont:12];
}

+ (UIFont *)boldFont13 {
    return [self boldFont:13];
}

+ (UIFont *) boldFont14 {
    return [self boldFont:14];
}

+ (UIFont *)boldFont15 {
    return [self boldFont:15];
}

+ (UIFont *)boldFont16 {
    return [self boldFont:16];
}

+ (UIFont *)boldFont17 {
    return [self boldFont:17];
}

+ (UIFont *)boldFont18 {
    return [self boldFont:18];
}

+ (UIFont *)boldFont19 {
    return [self boldFont:19];
}

+ (UIFont *)boldFont20 {
    return [self boldFont:20];
}

+ (UIFont *)boldFont21 {
    return [self boldFont:21];
}

+ (UIFont *)boldFont22 {
    return [self boldFont:22];
}

+ (UIFont *)boldFont23 {
    return [self boldFont:23];
}

+ (UIFont *)boldFont24 {
    return [self boldFont:24];
}

@end
