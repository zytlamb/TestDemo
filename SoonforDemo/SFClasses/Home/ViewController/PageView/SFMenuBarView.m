//
//  SFMenuBarView.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/12.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFMenuBarView.h"
#import "UIView+SFCommonLine.h"

@interface SFMenuBarView ()

@property (nonatomic,strong) UIButton *selectedBtn;
@end

@implementation SFMenuBarView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = SFColor_d7;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}
- (void)showTopLine {
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = SFColor_d7;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)updateMenuBarTitles:(NSArray *)barTitles {
    [self layoutIfNeeded];
    CGFloat width = self.width/barTitles.count;
    for(int i = 0;i < barTitles.count ; i++)
    {
        UIButton *button = [UIButton buttonWithTitle:barTitles[i] titleColor:SFTextColor3 bgColor:SFWhiteColor radius:0];
        button.titleLabel.font = [SFFont font14];
        [button setTitleColor:SFRedColor forState:UIControlStateSelected];
        [button layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:5];
        button.tag = i+100;
        button.x = width*i;
        button.y = 0;
        button.width = width;
        button.height = self.height;
        [button addLineLeft:NO LineRigth:YES color:SFColor_d7 space:self.height*0.25];
        [button addTarget:self action:@selector(clickItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)updateMenuBarTitles:(NSArray *)barTitles barImgs:(NSArray *)barImgs {
    [self layoutIfNeeded];
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    CGFloat width = self.width/barTitles.count;
    for(int i = 0;i < barTitles.count ; i++)
    {
        UIButton *button = [UIButton buttonWithTitle:barTitles[i] titleColor:SFTextColor8 bgColor:[UIColor clearColor] radius:0];
        button.titleLabel.font = [SFFont font11];
        [button setImage:[UIImage imageNamed:barImgs[i]] forState:UIControlStateNormal];
        [button layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleLeft imageTitleSpace:5];
        button.tag = i+100;
        button.x = width*i;
        button.y = 0;
        button.width = width;
        button.height = self.height;
        [button addLineLeft:NO LineRigth:YES color:SFColor_d7 space:self.height*0.25];
        [button addTarget:self action:@selector(clickItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)clickItemBtn:(UIButton*)sender
{
    if (sender != self.selectedBtn) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
        
    }else{
        self.selectedBtn.selected = YES;
        
    }
   
    if(self.delegate && [self.delegate respondsToSelector:@selector(menuBarViewSelectItemIndex:)])
    {
        [self.delegate menuBarViewSelectItemIndex:sender.tag-100];
        
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(menuBarViewSelectItemIndex:button:)])
    {
        [self.delegate menuBarViewSelectItemIndex:sender.tag-100 button:sender];
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
