//
//  SFTextViewViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFTextViewViewController.h"
#import "SFCustomTextView.h"

@interface SFTextViewViewController ()<SFCustomTextViewDelegate>

@end

@implementation SFTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义TextView";
    
    [self customTextView1];
    [self customTextView2];
}
- (void)customTextView1 {
    SFCustomTextView *customTextView = [[SFCustomTextView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT/4)];
    customTextView.placeholder = @"请输入您想要说的内容";
    customTextView.maxLength = 500;//如果不要显示就不要赋值
    customTextView.layer.borderColor = SFRedColor.CGColor;
    customTextView.layer.borderWidth = 1;
//    customTextView.textDelegate = self;
    [self.view addSubview:customTextView];
}

- (void)customTextView2 {
    SFCustomTextView *customTextView = [[SFCustomTextView alloc] initWithFrame:CGRectMake(0, SFSCREENHEIGHT/4+10, SFSCREENWIDTH/2, 40)];
    customTextView.placeholder = @"请输入您想要说的内容";
//    customTextView.maxLength = 500;//如果不要显示就不要赋值
    customTextView.layer.borderColor = SFTextColor8.CGColor;
    customTextView.layer.borderWidth = 1;
    customTextView.maxHeight = 80;
    customTextView.textDelegate = self;
    [self.view addSubview:customTextView];
    customTextView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);//边距
    customTextView.autoAdpterRect = YES;
    
}

#pragma mark -- CustomTextViewDelegate
- (void)customTextViewDidChange:(UITextView *)textView {

}
- (BOOL)customTextViewShouldReturn:(UITextView *)textView {
    return YES;
}
- (void)customTextViewDidEndEditing:(UITextView *)textView {
    
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
