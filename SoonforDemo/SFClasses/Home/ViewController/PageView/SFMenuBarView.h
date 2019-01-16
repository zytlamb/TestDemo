//
//  SFMenuBarView.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/12.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SFMenuBarViewDelegate<NSObject>
@optional

- (void)menuBarViewSelectItemIndex:(NSInteger)index;

- (void)menuBarViewSelectItemIndex:(NSInteger)index button:(UIButton *)button;

@end

@interface SFMenuBarView : UIView

@property(nonatomic, weak) id<SFMenuBarViewDelegate> delegate;

- (void)updateMenuBarTitles:(NSArray *)barTitles;

- (void)updateMenuBarTitles:(NSArray *)barTitles barImgs:(NSArray *)barImgs;
- (void)showBottomLine;
- (void)showTopLine;
@end
