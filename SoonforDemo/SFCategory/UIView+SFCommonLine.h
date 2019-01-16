//
//  UIView+SFCommonLine.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/26.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFCommonLine)
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color;

-(void)addLineLeft:(BOOL)IsAdd LineRigth:(BOOL)IsRigthAdd color:(UIColor*)color space:(CGFloat)space;

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color space:(CGFloat)space;

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color space:(CGFloat)space lineHeigth:(CGFloat)heigth;

//移除上下线
- (void)removeUpDownLine;
@end
