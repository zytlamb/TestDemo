//
//  SFNormalPickerView.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2019/1/16.
//  Copyright © 2019年 Dev SoonFor. All rights reserved.
//

#import "SFNormalPickerView.h"

@interface SFNormalPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation SFNormalPickerView
- (void)show {
    [[APPDELEGATE window] addSubview:self];
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = SFRGBA_Color(0, 0, 0, 0.5);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
