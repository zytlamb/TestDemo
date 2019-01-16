//
//  SFButtonViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFButtonViewController.h"
#import "UIButton+SFCustomButton.h"

@interface SFButtonViewController ()

@end

@implementation SFButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义Button";
    [self button1];
    [self button2];
    [self button3];
    [self button4];
}
- (void)button1 {
    UIButton *btn = [UIButton buttonWithTitle:@"图上字下" titleColor:SFWhiteColor bgColor:nil radius:0];
    btn.backgroundColor = SFTextColor8;
    [btn setImage:[UIImage imageNamed:@"icn_001"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(SFSCREENWIDTH/2-100, 0, 200, 100);
    [btn layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleTop imageTitleSpace:8];
    [self.view addSubview:btn];
    btn.tag = 1;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)button2 {
    UIButton *btn = [UIButton buttonWithTitle:@"图下字上" titleColor:SFWhiteColor bgColor:nil radius:0];
    btn.backgroundColor = SFTextColor8;
    [btn setImage:[UIImage imageNamed:@"icn_001"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(SFSCREENWIDTH/2-100, 110, 200, 100);
    [btn layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleBottom imageTitleSpace:8];
    [self.view addSubview:btn];
    
    btn.tag = 2;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)button3 {
    UIButton *btn = [UIButton buttonWithTitle:@"图左字右" titleColor:SFWhiteColor bgColor:nil radius:0];
    btn.backgroundColor = SFTextColor8;
    [btn setImage:[UIImage imageNamed:@"icn_001"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(SFSCREENWIDTH/2-100, 220, 200, 100);
    [btn layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    [self.view addSubview:btn];
    
    btn.tag = 3;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)button4 {
    UIButton *btn = [UIButton buttonWithTitle:@"图右字左" titleColor:SFWhiteColor bgColor:nil radius:0];
    btn.backgroundColor = SFTextColor8;
    [btn setImage:[UIImage imageNamed:@"icn_001"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(SFSCREENWIDTH/2-100,330, 200, 100);
    [btn layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:10];
    [self.view addSubview:btn];
    
    btn.tag = 4;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:{
            [sender setTitle:@"图片上文字下" forState:UIControlStateNormal];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleTop imageTitleSpace:8];
        }
            break;
        case 2:{
            [sender setTitle:@"图片下文字上" forState:UIControlStateNormal];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleBottom imageTitleSpace:8];
        }
            break;
        case 3:{
            [sender setTitle:@"图片左文字右" forState:UIControlStateNormal];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleLeft imageTitleSpace:10];
        }
            break;
        case 4:{
            [sender setTitle:@"图片右文字左" forState:UIControlStateNormal];
            [sender layoutButtonWithEdgeInsetsStyle:SFButtonEdgeInsetsStyleRight imageTitleSpace:10];
        }
            break;
            
        default:
            break;
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
