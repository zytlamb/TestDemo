//
//  SFCustomTextView.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SFCustomTextViewDelegate <NSObject>

@optional

/**
 textView 键盘return事件监听
 
 @param textView textView
 */
-(BOOL)customTextViewShouldReturn:(UITextView *)textView;

/**
 textView内容改变实时监听
 
 @param textView textView
 */
- (void)customTextViewDidChange:(UITextView *)textView;


/**
 textView end editing
 
 @param textView textView
 */
- (void)customTextViewDidEndEditing:(UITextView *)textView;

@end

@interface SFCustomTextView : UITextView
@property (nonatomic,weak) id <SFCustomTextViewDelegate> textDelegate;

/**
 允许输入的最大长度 默认 0不限制
 */
@property (nonatomic,assign) NSInteger maxLength;

/**
 输入内容长度
 */
@property (nonatomic,assign) NSInteger inputLength;


@property (nonatomic,assign) BOOL autoAdpterRect;//是否设置动态改变高度（默认为NO）

@property (nonatomic,assign) CGFloat maxHeight;//设置最高高度

@end
