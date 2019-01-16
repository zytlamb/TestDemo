//
//  UIView+SFFrame.h
//  KEDecorateTheScene
//
//  Created by Dev SoonFor on 2018/9/19.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@end
