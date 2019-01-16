//
//  SFDatePickerVC.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/28.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFDatePickerVC.h"
#import "WSDatePickerView.h"

@interface SFDatePickerVC ()

@end

@implementation SFDatePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self createUI1];
    [self createUI2];
}
- (void)createUI {
    UIButton *button = [UIButton buttonWithTitle:@"年月日时分" titleColor:SFTextColor3 bgColor:SFblueColor radius:0];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    button.tag = 100;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)createUI1 {
    UIButton *button = [UIButton buttonWithTitle:@"年月日" titleColor:SFTextColor3 bgColor:SFblueColor radius:0];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    button.tag = 110;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)createUI2 {
    UIButton *button = [UIButton buttonWithTitle:@"时分" titleColor:SFTextColor3 bgColor:SFblueColor radius:0];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    button.tag = 120;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonClick:(UIButton *)sender {
    
    if(sender.tag == 100){
        WSDatePickerView *picker = [[WSDatePickerView alloc]initWithDateStyle:DateStyleShowYearMonthDayHourMinute scrollToDate:[NSDate date:sender.titleLabel.text WithFormat:@"yyyy-MM-dd hh:mm"] CompleteBlock:^(NSDate *data) {
            NSString *cusDateStr = [data stringWithFormat:@"yyyy-MM-dd hh:mm"];
            [sender setTitle:cusDateStr forState:UIControlStateNormal];
            [sender layoutIfNeeded];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:10];
        }];
        picker.minLimitDate = [NSDate date];//不小于当前时间
        [picker show];
        
    }else if (sender.tag == 110){
        WSDatePickerView *picker = [[WSDatePickerView alloc]initWithDateStyle:DateStyleShowYearMonthDay scrollToDate:[NSDate date:sender.titleLabel.text WithFormat:@"yyyy-MM-dd"] CompleteBlock:^(NSDate *data) {
            NSString *cusDateStr = [data stringWithFormat:@"yyyy-MM-dd"];
            [sender setTitle:cusDateStr forState:UIControlStateNormal];
            [sender layoutIfNeeded];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:10];
        }];
        picker.maxLimitDate = [NSDate date];//不大于当前时间
        [picker show];
    }else if (sender.tag == 120){
        WSDatePickerView *picker = [[WSDatePickerView alloc]initWithDateStyle:DateStyleShowHourMinute scrollToDate:[NSDate date:sender.titleLabel.text WithFormat:@"hh:mm"] CompleteBlock:^(NSDate *data) {
            NSString *cusDateStr = [data stringWithFormat:@"hh:mm"];
            [sender setTitle:cusDateStr forState:UIControlStateNormal];
            [sender layoutIfNeeded];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:10];
        }];
    
        [picker show];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
