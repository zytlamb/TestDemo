//
//  SFTextFieldViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFTextFieldViewController.h"
#import "SFCustomTextField.h"

@interface SFTextFieldViewController ()<SFCustomTextFieldDelegate>

@end

@implementation SFTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义TextField";
    [self textField1];
    [self textField2];
    [self textField3];
    [self textField4];
}
- (void)textField1 {
    SFCustomTextField *customTextField = [[SFCustomTextField alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, 44)];
    customTextField.placeholder = @"请输入手机号";
    customTextField.max_char = 11;
    customTextField.isMustNumber = YES;
    customTextField.layer.borderColor = SFRedColor.CGColor;
    customTextField.layer.borderWidth = 1;
    customTextField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:customTextField];
    customTextField.textDelegate = self;
    
}
- (void)textField2 {
    SFCustomTextField *customTextField = [[SFCustomTextField alloc] initWithFrame:CGRectMake(0, 64, SFSCREENWIDTH, 44)];
    customTextField.placeholder = @"请输入你要说的话";
    customTextField.layer.borderColor = SFRedColor.CGColor;
    customTextField.layer.borderWidth = 1;
    [self.view addSubview:customTextField];
    customTextField.textDelegate = self;
    //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
    customTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    [customTextField textfieldHaveLeftSpacing:YES withSpacing:10];
   
}

- (void)textField3 {
    SFCustomTextField *customTextField = [[SFCustomTextField alloc] initWithFrame:CGRectMake(0, 124, SFSCREENWIDTH, 44)];
    customTextField.placeholder = @"请输入你要说的话";
    customTextField.layer.borderColor = SFRedColor.CGColor;
    customTextField.layer.borderWidth = 1;
    [self.view addSubview:customTextField];
    customTextField.textDelegate = self;
//    //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
//    customTextField.clearButtonMode = UITextFieldViewModeAlways;
  
    
//    [customTextField textfieldHaveLeftSpacing:YES withSpacing:10];
//    [customTextField textfieldLetfImageName:@"下载" withWidth:44];
//    [customTextField textfieldLetfTitle:@"下载" TitleColor:SFTextColor3 imageName:@"下载" bgColor:SFTextColor8 radius:0 borderWidth:0 borderColor:nil withLeftWidth:100];
    
    [customTextField textfieldLetfTitle:@"手机号码" TitleColor:SFTextColor3 imageName:nil bgColor:SFTextColor8 radius:0 withLeftWidth:100];
}

- (void)textField4 {
    SFCustomTextField *customTextField = [[SFCustomTextField alloc] initWithFrame:CGRectMake(0, 184, SFSCREENWIDTH, 44)];
    customTextField.placeholder = @"请输入你要搜索的商品";
    customTextField.layer.borderColor = SFTextColor8.CGColor;
    customTextField.layer.borderWidth = 1;
    [self.view addSubview:customTextField];
    customTextField.textDelegate = self;
    
    customTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    [customTextField textfieldLetfImageName:@"icn_search" withWidth:44];
    [customTextField textfieldRightTitle:@"搜索" TitleColor:SFWhiteColor imageName:nil bgColor:SFRedColor radius:0 withRightWidth:60];
    
}

//点击return
- (BOOL)customTextFieldShouldReturn:(UITextField *)textfield {
    NSLog(@"点击了return");
    return YES;
}

//输入框中叉号的点击
- (BOOL)customTextFieldShouldClear:(UITextField *)textfield {
    NSLog(@"点击了Clear");
    return YES;
}

// 键盘删除按钮点击
- (void)customTextFieldDeleteBackward:(UITextField *)textField {
    NSLog(@"点击键盘删除按钮");
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
