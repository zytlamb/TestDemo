//
//  SFCustomAlterView.h
//  SFDesigner
//
//  Created by Dev SoonFor on 2018/4/2.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum SFAlterType {
    SFAlterTypeLabel,
    SFAlterTypeText
} SFAlterType;

//取消按钮点击事件
typedef void(^cancelBlock)(void);

//确定按钮点击事件
typedef void(^sureBlock)(NSString *str);

@interface SFCustomAlterView : UIView

- (void)show;

@property (nonatomic, strong) UITextField *contentTF;


@property(nonatomic,copy)cancelBlock cancel_block;
@property(nonatomic,copy)sureBlock sure_block;

/**
 *
 *  @param title       标题
 *  @param content     内容
 *  @param cancel      取消按钮内容
 *  @param sure        确定按钮内容
 *  @param cancelBlock 取消按钮点击事件
 *  @param sureBlock   确定按钮点击事件

 */
//+(instancetype)alterViewWithTitle:(NSString *)title
//                          content:(NSString *)content
//                           cancel:(NSString *)cancel
//                             sure:(NSString *)sure
//                    cancelBtClcik:(cancelBlock)cancelBlock
//                      sureBtClcik:(sureBlock)sureBlock;


+(instancetype)alterViewWithTitle:(NSString *)title
                        alterType:(SFAlterType)alterType
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
                    cancelBtClcik:(cancelBlock)cancelBlock
                      sureBtClcik:(sureBlock)sureBlock;

/*
 不带取消的提示框
 */
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                             sure:(NSString *)sure
                      sureBtClcik:(sureBlock)sureBlock;

+(instancetype)alterViewNoLineWithTitle:(NSString *)title
                                content:(NSString *)content
                                 cancel:(NSString *)cancel
                                   sure:(NSString *)sure
                          cancelBtClcik:(cancelBlock)cancelBlock
                            sureBtClcik:(sureBlock)sureBlock CanCancel:(BOOL)CanCancel;
@end
