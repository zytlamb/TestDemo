//
//  UITextView+SFPlaceholder.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SFPlaceholder)
@property (nonatomic, readonly) UILabel *placeholderLabel;
@property (nonatomic, strong)   NSString *placeholder;
@property (nonatomic, strong)   NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong)   UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;
@end
