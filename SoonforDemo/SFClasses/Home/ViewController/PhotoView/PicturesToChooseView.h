//
//  PicturesToChooseView.h
//  PicturesToChooseDemo
//
//  Created by 今日 on 2018/9/27.
//  Copyright © 2018年 今日. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicturesToChooseView : UIView

/**
 图片的大小
 */
@property (nonatomic,assign) CGSize imgSize;

/**
 样式类型 0.横向 1.纵向
 */
@property (nonatomic,assign) NSInteger styleType;

/**
 图片之间的间隙
 */
@property (nonatomic,assign) NSInteger screenDistance;

/**
 屏幕距离 第一张图片与屏幕的距离
 */
@property (nonatomic,assign) NSInteger clearance;

/**
 图片数据源
 */
@property (nonatomic,strong) NSMutableArray *dataList;

/**
 图片选择编号数据源
 */
@property (nonatomic,strong) NSMutableArray *chooseList;

/**
 选择图片后的回调
 */
@property (nonatomic,copy)void(^picturesToChooseView)(NSMutableArray *dataList,NSMutableArray *chooseList);

/**
 图片个数   默认99
 */
@property (nonatomic,assign) NSInteger imgNum;
@end
