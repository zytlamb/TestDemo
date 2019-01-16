//
//  UIView+SFCommonLine.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/26.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "UIView+SFCommonLine.h"

#define kTagLineView 10101010879
#define KTagLineLeftRigth 10101010878

@implementation UIView (SFCommonLine)
-(void)addLineLeft:(BOOL)IsAdd LineRigth:(BOOL)IsRigthAdd color:(UIColor*)color space:(CGFloat)space
{
    [self removeLeftRigthViewWithTag:KTagLineLeftRigth];
    if(IsAdd)
    {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
        lineView.backgroundColor = color;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(space);
            make.bottom.mas_equalTo(-space);
            make.width.mas_equalTo(0.5);
        }];
    }
    
    if(IsRigthAdd)
    {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
        lineView.backgroundColor = color;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(space);
            make.bottom.mas_equalTo(-space);
            make.width.mas_equalTo(0.5);
        }];
    }
}


+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color{
    return [self lineViewWithPointYY:pointY andColor:color andLeftSpace:0 lineHeigth:0.5];
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace lineHeigth:(CGFloat)heigth{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, pointY, SFSCREENWIDTH - leftSpace*2, heigth)];
    lineView.backgroundColor = color;
    return lineView;
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color space:(CGFloat)space lineHeigth:(CGFloat)heigth
{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color andLeftSpace:space lineHeigth:heigth];
        upView.tag = kTagLineView;
        [self addSubview:upView];
        
        [upView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-space);
            make.left.mas_equalTo(space);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(heigth);
        }];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:self.height-heigth andColor:color andLeftSpace:space lineHeigth:heigth];
        downView.tag = kTagLineView;
        [self addSubview:downView];
        
        [downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-space);
            make.left.mas_equalTo(space);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(heigth);
        }];
    }
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color space:(CGFloat)space{
    
    [self addLineUp:hasUp andDown:hasDown andColor:color space:space lineHeigth:0.5];
    
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color{
    
    [self addLineUp:hasUp andDown:hasDown andColor:color space:0];
}

- (void)removeViewWithTag:(NSInteger)tag{
    for (UIView *aView in [self subviews]) {
        if (aView.tag == tag) {
            [aView removeFromSuperview];
        }
    }
}

- (void)removeLeftRigthViewWithTag:(NSInteger)tag{
    for (UIView *aView in [self subviews]) {
        if (aView.tag == tag) {
            [aView removeFromSuperview];
        }
    }
}

- (void)removeUpDownLine
{
    UIView *view = [self viewWithTag:kTagLineView];
    if(view)
        [view removeFromSuperview];
}
@end
